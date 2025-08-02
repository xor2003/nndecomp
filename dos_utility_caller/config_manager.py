"""
Configuration Manager for DOS Utility Caller

Handles DOSBox configuration, environment variables, and mount points.
"""

import configparser
import os
import re
from typing import Dict, Any, Optional
from pathlib import Path


class ConfigManager:
    """Manages configuration for DOSBox execution environment."""
    
    def __init__(self, config_file: Optional[str] = None):
        """
        Initialize the configuration manager.
        
        Args:
            config_file: Path to a .doscfg configuration file
        """
        # Disable interpolation to avoid issues with %PATH% syntax
        self.config = configparser.ConfigParser(interpolation=None)
        if config_file and os.path.exists(config_file):
            self.config.read(config_file)
        else:
            self._set_default_config()
    
    def _set_default_config(self):
        """Set default DOSBox configuration."""
        self.config['sdl'] = {
            'fullscreen': 'false',
            'vsync': 'false'
        }
        
        self.config['render'] = {
            'aspect': 'false'
        }
        
        self.config['dosbox'] = {
            'machine': 'svga_s3'
        }
        
        self.config['cpu'] = {
            'cycles': '20000'
        }
        
        
        # Get current directory for disk C:
        current_dir = os.getcwd()
        
        # Get TOOL_ROOT_DIR environment variable for disk D:, fallback to default if not set
        tool_root_dir = os.environ.get('TOOL_ROOT_DIR', '/home/xor/nndecomp/msc60')
        
        self.config['mount'] = {
            'c': current_dir,
            'd': tool_root_dir
        }
        
        self.config['output'] = {
            'capture_stdout': 'true',
            'capture_stderr': 'true',
            'output_directory': '.'
        }
        
        
        self.config['execution'] = {
            'timeout': '60'  # 5 minutes default timeout
        }
    
    def get_dosbox_config(self) -> Dict[str, Dict[str, str]]:
        """
        Get the DOSBox configuration as a dictionary.
        
        Returns:
            Dictionary representation of the DOSBox configuration
        """
        config_dict = {}
        for section_name in self.config.sections():
            config_dict[section_name] = dict(self.config[section_name])
        return config_dict
    
    def get_mount_points(self) -> Dict[str, str]:
        """
        Get mount point mappings.
        
        Returns:
            Dictionary of drive letter to directory mappings
        """
        if 'mount' in self.config:
            return dict(self.config['mount'])
        return {}
    
    def get_environment_vars(self) -> Dict[str, str]:
        """
        Get environment variable settings.
        
        Returns:
            Dictionary of environment variables
        """
        if 'environment' in self.config:
            return dict(self.config['environment'])
        return {}
    
    def _convert_path_to_dosbox(self, path: str, mount_points: Dict[str, str]) -> str:
        """
        Convert a Linux path to DOSBox path format.
        
        Args:
            path: Linux path to convert
            mount_points: Dictionary of drive letter to directory mappings
            
        Returns:
            DOSBox path format (e.g., C:\\DIR\\FILE.TXT)
        """
        # Normalize the path
        path = os.path.normpath(path)
        
        # Check each mount point to see if the path is under it
        for drive_letter, mount_dir in mount_points.items():
            mount_dir = os.path.normpath(mount_dir)
            if path.startswith(mount_dir):
                # Replace the mount directory with the drive letter
                relative_path = os.path.relpath(path, mount_dir)
                dos_path = f"{drive_letter.upper()}:\\{relative_path.replace('/', '\\')}"
                return dos_path
        
        # If no mount point matched, return the original path
        return path
    
    def get_environment_vars_with_path_conversion(self) -> Dict[str, str]:
        """
        Get environment variables with path conversion for DOSBox.
        
        Returns:
            Dictionary of environment variables with paths converted to DOSBox format
        """
        env_vars = self.get_environment_vars()
        mount_points = self.get_mount_points()
        
        # Convert paths in environment variables
        converted_env_vars = {}
        for key, value in env_vars.items():
            # Check if the value contains paths (look for common path patterns)
            if re.search(r'[\/]|\w:[\/\\]', value):
                # Split the value by common separators and convert paths
                parts = re.split(r'([;:])', value)  # Split by ; or :
                converted_parts = []
                for part in parts:
                    if re.search(r'[\/]|\w:[\/\\]', part):
                        # This looks like a path, try to convert it
                        converted_part = self._convert_path_to_dosbox(part, mount_points)
                        converted_parts.append(converted_part)
                    else:
                        converted_parts.append(part)
                converted_env_vars[key] = ''.join(converted_parts)
            else:
                converted_env_vars[key] = value
        
        return converted_env_vars
    
    def update_config(self, updates: Dict[str, Dict[str, Any]]) -> None:
        """
        Update configuration with new values.
        
        Args:
            updates: Dictionary of configuration updates
        """
        for section, settings in updates.items():
            if not self.config.has_section(section):
                self.config.add_section(section)
            for key, value in settings.items():
                self.config[section][key] = str(value)
    
    def save_config(self, filepath: str) -> None:
        """
        Save configuration to a file.
        
        Args:
            filepath: Path to save the configuration file
        """
        with open(filepath, 'w') as configfile:
            self.config.write(configfile)