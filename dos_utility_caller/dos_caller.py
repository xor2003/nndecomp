"""
Generic DOS Utility Caller Tool

This module provides a transparent interface for executing DOS commands
while handling environment setup, argument passing, and output capture.
"""

import os
import tempfile
import logging
from typing import List, Dict, Any, Optional
from pathlib import Path

from .config_manager import ConfigManager
from .batch_generator import BatchGenerator
from .dosbox_executor import DOSBoxExecutor, DOSBoxExecutionError
from .output_handler import OutputHandler
from .filename_validator import FilenameValidator, FilenameValidationError


def call_dos_utility(
    command: str,
    arguments: List[str] = None,
    source_dir: str = None,
    tools_dir: str = None,
    environment: Dict[str, str] = None,
    dosbox_config: Dict[str, Any] = None,
    capture_output: bool = True,
    working_dir: str = None
) -> Dict[str, Any]:
    """
    Execute a DOS utility command and return results.
    
    Args:
        command: DOS command to execute
        arguments: Command arguments
        source_dir: Source directory to mount as C:
        tools_dir: Tools directory to mount as D:
        environment: Additional environment variables
        dosbox_config: DOSBox configuration overrides
        capture_output: Whether to capture output
        working_dir: Working directory for DOSBox
        
    Returns:
        {
            'stdout': str,           # Standard output
            'stderr': str,           # Standard error
            'exit_code': int,        # Exit code
            'success': bool          # Success status
        }
    """
    
    # Set up logging
    logger = logging.getLogger(__name__)
    try:
        logger.debug("call_dos_utility called with command=%s, arguments=%s", command, arguments)
        
        # Validate filenames in arguments (skip command-line flags)
        if arguments:
            # Only validate arguments that don't start with / or - (command-line flags)
            filenames = [arg for arg in arguments if not arg.startswith('/') and not arg.startswith('-')]
            if filenames:
                logger.debug("Validating filenames: %s", filenames)
                FilenameValidator.validate_filenames(filenames)
        
        # Initialize components
        logger.debug("Initializing components")
        config_manager = ConfigManager()
        batch_generator = BatchGenerator()
        dosbox_executor = DOSBoxExecutor()
        output_handler = OutputHandler()
        
        # Update configuration if provided
        if dosbox_config:
            logger.debug("Updating configuration: %s", dosbox_config)
            config_manager.update_config(dosbox_config)
        
        # Update mount points if provided
        mount_updates = {}
        if source_dir:
            mount_updates['c'] = source_dir
        if tools_dir:
            mount_updates['d'] = tools_dir
            
        if mount_updates:
            logger.debug("Updating mount points: %s", mount_updates)
            config_manager.update_config({'mount': mount_updates})
        
        # Update environment variables if provided
        if environment:
            logger.debug("Updating environment variables: %s", environment)
            config_manager.update_config({'environment': environment})
        
        # Convert command and arguments to DOS paths
        dos_command = config_manager.convert_path_to_dosbox(command)
        dos_arguments = []
        if arguments:
            for arg in arguments:
                # Don't convert command-line switches
                if arg.startswith('/') or arg.startswith('-'):
                    dos_arguments.append(arg)
                else:
                    dos_arguments.append(config_manager.convert_path_to_dosbox(arg))

        # Generate batch file
        if capture_output:
            # Create temporary file for output capture in the current working directory
            stdout_file = os.path.join(os.getcwd(), "STDOUT.TXT")
            # Create empty file
            open(stdout_file, 'w').close()
            logger.debug("Created temporary file: stdout=%s", stdout_file)
            
            # Pass absolute paths to the batch generator
            batch_file = batch_generator.generate_simple_batch(
                dos_command, dos_arguments, "C:\\STDOUT.TXT"
            )
            logger.debug("Generated simple batch file: %s", batch_file)
        else:
            batch_file = batch_generator.generate_batch_with_case_warning(dos_command, dos_arguments)
            logger.debug("Generated batch file with case warning: %s", batch_file)
        
        # Get configuration
        config = config_manager.get_dosbox_config()
        
        # Update environment variables with path conversion
        # Only add environment variables if they were explicitly provided
        if environment:
            env_vars = config_manager.get_environment_vars_with_path_conversion()
            if 'environment' in config:
                config['environment'].update(env_vars)
            else:
                config['environment'] = env_vars
        
        # Execute in DOSBox
        logger.debug("Executing DOSBox with batch file: %s", batch_file)
        exit_code = dosbox_executor.execute(batch_file, config, working_dir)
        logger.debug("DOSBox execution completed with exit code: %d", exit_code)
        
        # Process output
        if capture_output:
            logger.debug("Capturing output from files: stdout=%s", stdout_file)
            output = output_handler.capture_output(stdout_file)
            logger.debug("Captured output: %s", output)
            result = output_handler.process_output(output['stdout'])
            logger.debug("Processed output result: %s", result)
            
            # Clean up temporary files
            # Temporarily disable cleanup for debugging
            # for temp_file in [stdout_file, batch_file]:
            #     if os.path.exists(temp_file):
            #         logger.debug("Cleaning up temporary file: %s", temp_file)
            #         os.remove(temp_file)
            logger.debug("Skipping cleanup of temporary files for debugging")
        else:
            result = {
                'stdout': '',
                'stderr': '',
                'exit_code': exit_code,
                'success': exit_code == 0
            }
            logger.debug("No output capture, result: %s", result)
            # Clean up batch file
            if os.path.exists(batch_file):
                logger.debug("Cleaning up batch file: %s", batch_file)
                os.remove(batch_file)
        
        return result
        
    except FilenameValidationError as e:
        return {
            'stdout': '',
            'stderr': f'Filename validation error: {str(e)}',
            'exit_code': 1,
            'success': False
        }
    except DOSBoxExecutionError as e:
        return {
            'stdout': '',
            'stderr': f'DOSBox execution error: {str(e)}',
            'exit_code': 1,
            'success': False
        }
    except Exception as e:
        return {
            'stdout': '',
            'stderr': f'Unexpected error: {str(e)}',
            'exit_code': 1,
            'success': False
        }