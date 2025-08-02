"""
DOSBox Executor for DOS Utility Caller

Handles execution of DOS commands through DOSBox.
"""

import subprocess
import tempfile
import os
import configparser
import signal
import time
import logging
from typing import Dict, List, Optional
from pathlib import Path


class DOSBoxExecutionError(Exception):
    """Exception raised for DOSBox execution errors."""
    pass


class DOSBoxExecutor:
    """Executes DOS commands through DOSBox."""
    
    def __init__(self, dosbox_path: str = "dosbox"):
        """
        Initialize the DOSBox executor.
        
        Args:
            dosbox_path: Path to the DOSBox executable
        """
        self.dosbox_path = dosbox_path
        # Default timeout is 5 minutes (300 seconds)
        self.default_timeout = 300
    
    def execute(self, batch_file: str, config: Dict[str, Dict[str, str]],
                working_dir: str = None) -> int:
        """
        Execute a batch file in DOSBox.
        
        Args:
            batch_file: Path to the batch file to execute
            config: DOSBox configuration
            working_dir: Working directory for DOSBox
            
        Returns:
            Exit code from DOSBox execution
            
        Raises:
            DOSBoxExecutionError: If DOSBox execution fails
        """
        
        # Set up logging
        logger = logging.getLogger(__name__)
        # Create temporary config file
        config_file = self._create_config_file(config, batch_file)
        
        # Prepare command
        cmd = [self.dosbox_path, "-conf", config_file, "-noconsole", "--exit"]
        logger.debug(cmd)
        # Set working directory if specified
        cwd = working_dir if working_dir else None
        
        # Get timeout from config or use default
        timeout = config.get('execution', {}).get('timeout', self.default_timeout)
        timeout = int(timeout)
        
        try:
            # Execute DOSBox with timeout
            result = subprocess.run(
                cmd,
                cwd=cwd,
                capture_output=True,
                text=True,
                timeout=timeout
            )
            return result.returncode
        except subprocess.TimeoutExpired:
            raise DOSBoxExecutionError(f"DOSBox execution timed out after {timeout} seconds")
        except Exception as e:
            raise DOSBoxExecutionError(f"Failed to execute DOSBox: {str(e)}")
        #finally:
        #    # Clean up temporary config file
        #    if os.path.exists(config_file):
        #        os.remove(config_file)
    
    def _create_config_file(self, config: Dict[str, Dict[str, str]], batch_file: str) -> str:
        """
        Create a temporary DOSBox configuration file.
        
        Args:
            config: DOSBox configuration dictionary
            batch_file: Path to the batch file to execute
            
        Returns:
            Path to the temporary configuration file
        """
        # Set up logging
        logger = logging.getLogger(__name__)
        
        # Create config parser
        config_parser = configparser.ConfigParser()
        
        # Add configuration sections except autoexec
        for section, settings in config.items():
            if section != 'autoexec':
                config_parser.add_section(section)
                for key, value in settings.items():
                    config_parser[section][key] = str(value)
        
        # Handle autoexec section properly
        if not config_parser.has_section('autoexec'):
            config_parser.add_section('autoexec')
        
        # Get mount points from config
        mount_points = config.get('mount', {})
        
        # Build autoexec lines
        autoexec_lines = []
        
        # Add mount commands with actual paths
        if 'c' in mount_points:
            autoexec_lines.append(f"mount c \"{mount_points['c']}\"")
        if 'd' in mount_points:
            autoexec_lines.append(f"mount d \"{mount_points['d']}\"")
                
        # Change to C: drive
        autoexec_lines.append("c:")
        
        # Add the batch file call
        autoexec_lines.append(f"{os.path.basename(batch_file)}")
        
        # Set the autoexec content
        autoexec_content = "\n".join(autoexec_lines)
        logger.debug("Final autoexec content:\n%s", autoexec_content)
        
        # Write to temporary file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.conf', delete=False) as f:
            # Write all sections except autoexec using configparser
            # Remove autoexec section if it exists
            if config_parser.has_section('autoexec'):
                config_parser.remove_section('autoexec')
            config_parser.write(f)
            
            # Write autoexec section manually
            f.write("\n[autoexec]\n")
            f.write(autoexec_content)
            f.write("\n")
            return f.name