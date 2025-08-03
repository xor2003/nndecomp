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
    
    def _get_dosbox_country_code(self) -> str:
        """
        Get DOSBox country code based on system locale.
        
        Returns:
            Country code string for DOSBox configuration
        """
        import locale
        try:
            # Get the current locale
            current_locale = locale.getdefaultlocale()[0]
            if current_locale:
                # Map locale to DOSBox country code
                locale_mapping = {
                    'ru_RU': '7',      # Russia
                    'en_US': '1',      # United States
                    'en_GB': '44',     # United Kingdom
                    'de_DE': '49',     # Germany
                    'fr_FR': '33',     # France
                    'es_ES': '34',     # Spain
                    'it_IT': '39',     # Italy
                    'pt_BR': '55',     # Brazil
                    'ja_JP': '81',     # Japan
                    'zh_CN': '86',     # China
                    'ko_KR': '82',     # Korea
                }
                
                # Check for exact match
                if current_locale in locale_mapping:
                    return locale_mapping[current_locale]
                
                # Check for language prefix match
                lang_prefix = current_locale.split('_')[0]
                for locale_key, country_code in locale_mapping.items():
                    if locale_key.startswith(lang_prefix):
                        return country_code
        except:
            pass
        
        # Default to US English
        return '1'
    
    def _get_dosbox_keyboard_layout(self) -> str:
        """
        Get DOSBox keyboard layout based on system locale.
        
        Returns:
            Keyboard layout string for DOSBox configuration
        """
        import locale
        try:
            # Get the current locale
            current_locale = locale.getdefaultlocale()[0]
            if current_locale:
                # Map locale to DOSBox keyboard layout
                layout_mapping = {
                    'ru_RU': 'ru',     # Russia
                    'en_US': 'us',     # United States
                    'en_GB': 'uk',     # United Kingdom
                    'de_DE': 'de',     # Germany
                    'fr_FR': 'fr',     # France
                    'es_ES': 'es',     # Spain
                    'it_IT': 'it',     # Italy
                    'pt_BR': 'br',     # Brazil
                    'ja_JP': 'jp',     # Japan
                    'zh_CN': 'cn',     # China
                    'ko_KR': 'kr',     # Korea
                }
                
                # Check for exact match
                if current_locale in layout_mapping:
                    return layout_mapping[current_locale]
                
                # Check for language prefix match
                lang_prefix = current_locale.split('_')[0]
                for locale_key, layout_code in layout_mapping.items():
                    if locale_key.startswith(lang_prefix):
                        return layout_code
        except:
            pass
        
        # Default to US English
        return 'us'
    
    def _get_dosbox_codepage(self) -> str:
        """
        Get DOSBox codepage based on system locale.
        
        Returns:
            Codepage string for DOSBox configuration
        """
        import locale
        try:
            # Get the current locale
            current_locale = locale.getdefaultlocale()[0]
            if current_locale:
                # Map locale to DOSBox codepage
                # Based on common locale to codepage mappings
                codepage_mapping = {
                    'ru_RU': '866',    # Russian
                    'en_US': '437',    # United States
                    'en_GB': '850',    # United Kingdom
                    'de_DE': '850',    # German
                    'fr_FR': '850',    # French
                    'es_ES': '850',    # Spanish
                    'it_IT': '850',    # Italian
                    'pt_BR': '850',    # Portuguese (Brazil)
                    'ja_JP': '932',    # Japanese
                    'zh_CN': '936',    # Simplified Chinese
                    'ko_KR': '949',    # Korean
                }
                
                # Check for exact match
                if current_locale in codepage_mapping:
                    return codepage_mapping[current_locale]
                
                # Check for language prefix match
                lang_prefix = current_locale.split('_')[0]
                for locale_key, codepage in codepage_mapping.items():
                    if locale_key.startswith(lang_prefix):
                        return codepage
        except:
            pass
        
        # Default to US English codepage
        return '437'
    
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
            'machine': 'svga_s3',
            'country': self._get_dosbox_country_code(),
            'keyboardlayout': self._get_dosbox_keyboard_layout()
        }
        
        # Add codepage configuration
        codepage = self._get_dosbox_codepage()
        if codepage:
            self.config['dosbox']['codepage'] = codepage
        
        self.config['cpu'] = {
            'cycles': '20000'
        }
        
        
        # Get current directory for disk C:
        current_dir = os.getcwd()
        
        # Get TOOL_ROOT_DIR environment variable for disk D:, fallback to default if not set
        tool_root_dir = os.environ.get('TOOL_ROOT_DIR', current_dir)
        
        self.config['mount'] = {
            'c': current_dir,
            'd': tool_root_dir
        }
        
        self.config['output'] = {
            'capture_stdout': 'true',
            'output_directory': '.'
        }
        
        
        self.config['execution'] = {
            'timeout': '300'  # 5 minutes default timeout
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
    
    def convert_path_to_dosbox(self, path_str: str) -> str:
        """
        Convert a Linux path to a DOSBox path using pathlib.
        Handles both absolute and relative paths.
        """
        try:
            mount_points = self.get_mount_points()
            p = Path(path_str)
            
            # If the path is absolute, check if it's inside a mount point
            if p.is_absolute():
                for drive, mount_dir_str in mount_points.items():
                    mount_dir = Path(mount_dir_str).resolve()
                    try:
                        if p.resolve().is_relative_to(mount_dir):
                            relative_p = p.resolve().relative_to(mount_dir)
                            dos_path = f"{drive.upper()}:\\{str(relative_p)}"
                            return dos_path.replace('/', '\\')
                    except (ValueError, OSError):
                        # Handle cases where path resolution fails
                        continue
                # If it's absolute but not in a mount, we can't translate it
                return path_str # or raise an error
            
            # If the path is relative, check if it exists inside any mount point
            for drive, mount_dir_str in mount_points.items():
                mount_dir = Path(mount_dir_str)
                try:
                    if (mount_dir / p).exists():
                        # It exists relative to this mount point
                        dos_path = f"{drive.upper()}:\\{str(p)}"
                        return dos_path.replace('/', '\\')
                except (OSError, PermissionError):
                    # Handle cases where file system access fails
                    continue
            
            # For relative paths that don't exist, assume they are DOS commands or paths
            # and convert slashes to backslashes
            return path_str.replace('/', '\\')
        except Exception:
            # If any error occurs, return the original path
            return path_str

    def get_environment_vars_with_path_conversion(self) -> Dict[str, str]:
        """
        Get environment variables with path conversion for DOSBox.
        """
        env_vars = self.get_environment_vars()
        converted_env_vars = {}
        for key, value in env_vars.items():
            # A simple check for something that looks like a path
            if '/' in value or '\\' in value:
                parts = re.split(r'([;:])', value)
                converted_parts = [self.convert_path_to_dosbox(part) if '/' in part or '\\' in part else part for part in parts]
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