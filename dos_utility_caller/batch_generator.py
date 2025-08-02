"""
Batch File Generator for DOS Utility Caller

Generates DOS batch files with dynamic variable substitution.
"""

import tempfile
import os
import logging
from typing import List, Dict, Optional
from pathlib import Path


class BatchGenerator:
    """Generates DOS batch files for command execution."""
    
    def __init__(self):
        """Initialize the batch generator."""
        pass
    
    def generate_simple_batch(self, command: str, arguments: List[str] = None, 
                             stdout_file: str = "stdout.txt", 
                             stderr_file: str = "stderr.txt") -> str:
        """
        Generate a simple batch file for command execution.
        
        Args:
            command: DOS command to execute
            arguments: Command arguments
            stdout_file: File to capture stdout
            stderr_file: File to capture stderr
            
        Returns:
            Path to the generated batch file
        """
        # Create argument string
        arg_str = ""
        if arguments:
            arg_str = " " + " ".join(arguments)
        
        # Create batch content
        batch_content = f"""@echo off
{command}{arg_str} > {stdout_file} 2> {stderr_file}
echo %ERRORLEVEL% > C:\\EXITCODE.TXT
echo TEST > C:\\TEST.TXT
dir C:\\*.TXT
"""
        
        # Write to temporary file
        return self._write_batch_file(batch_content)
    
    def generate_compilation_batch(self, command: str, arguments: List[str] = None,
                                  tool_name: str = "compiler", 
                                  output_file: str = None,
                                  file_pattern: str = "*.OBJ") -> str:
        """
        Generate a compilation batch file.
        
        Args:
            command: DOS command to execute
            arguments: Command arguments
            tool_name: Name of the tool being used
            output_file: Expected output file
            file_pattern: File pattern to show in directory listing
            
        Returns:
            Path to the generated batch file
        """
        # Create argument string
        arg_str = ""
        if arguments:
            arg_str = " " + " ".join(arguments)
        
        # Create batch content
        batch_content = f"""@echo on
echo Compiling with {tool_name}...
echo.

echo Executing: {command}{arg_str}
{command}{arg_str}
echo Exit code: %ERRORLEVEL%
"""
        
        # Add output file verification if specified
        if output_file:
            batch_content += f"""if exist {output_file} echo {output_file} created successfully
if not exist {output_file} echo {output_file} NOT created
"""
        
        # Add directory listing
        batch_content += f"""
echo.
echo Final files:
dir {file_pattern}
"""
        
        # Write to temporary file
        return self._write_batch_file(batch_content)
    
    def generate_batch_with_case_warning(self, command: str, arguments: List[str] = None) -> str:
        """
        Generate a batch file with case warning.
        
        Args:
            command: DOS command to execute
            arguments: Command arguments
            
        Returns:
            Path to the generated batch file
        """
        # Create argument string
        arg_str = ""
        if arguments:
            arg_str = " " + " ".join(arguments)
        
        # Create batch content with case warning
        batch_content = f"""@echo on
echo Executing: {command}{arg_str}
echo.

{command}{arg_str}
echo Exit code: %ERRORLEVEL%

echo.
echo NOTE: Generated files may be in UPPER CASE due to DOS limitations.
echo Please check for files with uppercase names in the output directory.
echo.
"""
        
        # Write to temporary file
        return self._write_batch_file(batch_content)
    
    def _write_batch_file(self, content: str) -> str:
        """
        Write batch content to a file in the current directory.
        
        Args:
            content: Batch file content
            
        Returns:
            Path to the generated batch file
        """
        # Set up logging
        logger = logging.getLogger(__name__)
        logger.debug("Writing batch file with content:\n%s", content)
        
        # Create file in current directory with 8.3 compliant name
        import os
        import time
        import random
        # Generate a unique 8.3 compliant filename in the current directory
        temp_dir = os.getcwd()
        
        # Generate a unique identifier using timestamp and random number
        unique_id = f"{int(time.time() * 1000000) % 1000000:06d}"
        
        # Create 8.3 compliant filename (8 chars for name, 3 for extension)
        # Use first 5 chars of unique_id + fixed prefix for name
        name_part = f"BAT{unique_id[:5]}"
        filename = f"{name_part}.BAT"
        filepath = os.path.join(temp_dir, filename)
        
        # Write content to file
        with open(filepath, 'w') as f:
            f.write(content)
            logger.debug("Created batch file: %s", filepath)
            return filepath