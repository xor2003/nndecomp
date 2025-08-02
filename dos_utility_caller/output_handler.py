"""
Output Handler for DOS Utility Caller

Handles capturing and processing of DOS command output.
"""

import os
import re
from typing import Dict, Optional


class OutputHandler:
    """Handles capturing and processing of DOS command output."""
    
    def __init__(self):
        """Initialize the output handler."""
        pass
    
    def capture_output(self, stdout_file: str = None, stderr_file: str = None) -> Dict[str, str]:
        """
        Capture output from files.
        
        Args:
            stdout_file: File containing stdout
            stderr_file: File containing stderr
            
        Returns:
            Dictionary with stdout and stderr content
        """
        output = {
            'stdout': '',
            'stderr': ''
        }
        
        # Read stdout if file exists
        if stdout_file and os.path.exists(stdout_file):
            try:
                with open(stdout_file, 'r', encoding='cp850') as f:  # DOS encoding
                    output['stdout'] = f.read()
            except Exception:
                # Fallback to utf-8
                try:
                    with open(stdout_file, 'r', encoding='utf-8') as f:
                        output['stdout'] = f.read()
                except Exception as e:
                    output['stdout'] = f"Error reading stdout file: {str(e)}"
        
        # Read stderr if file exists
        if stderr_file and os.path.exists(stderr_file):
            try:
                with open(stderr_file, 'r', encoding='cp850') as f:  # DOS encoding
                    output['stderr'] = f.read()
            except Exception:
                # Fallback to utf-8
                try:
                    with open(stderr_file, 'r', encoding='utf-8') as f:
                        output['stderr'] = f.read()
                except Exception as e:
                    output['stderr'] = f"Error reading stderr file: {str(e)}"
        
        return output
    
    def extract_exit_code(self, output: str) -> Optional[int]:
        """
        Extract exit code from DOS command output.
        
        Args:
            output: Command output containing exit code information
            
        Returns:
            Exit code if found, None otherwise
        """
        # Look for exit code pattern
        match = re.search(r'Exit code: (\d+)', output)
        if match:
            return int(match.group(1))
        return None
    
    def process_output(self, stdout: str = "", stderr: str = "") -> Dict[str, any]:
        """
        Process output and extract relevant information.
        
        Args:
            stdout: Standard output
            stderr: Standard error
            
        Returns:
            Dictionary with processed output information
        """
        result = {
            'stdout': stdout,
            'stderr': stderr,
            'exit_code': 0,
            'success': True
        }
        
        # Read exit code from file
        exit_code_file = os.path.join(os.getcwd(), "EXITCODE.TXT")
        if os.path.exists(exit_code_file):
            with open(exit_code_file, 'r') as f:
                try:
                    exit_code = int(f.read().strip())
                    result['exit_code'] = exit_code
                    result['success'] = (exit_code == 0)
                except (ValueError, TypeError):
                    pass # Ignore if the file is empty or contains non-integer data
            # Clean up the exit code file
            try:
                os.remove(exit_code_file)
            except:
                pass # Ignore if file can't be removed
        else:
            # Try to extract exit code from stdout or stderr
            exit_code = self.extract_exit_code(stdout)
            if exit_code is None and stderr:
                exit_code = self.extract_exit_code(stderr)
            
            if exit_code is not None:
                result['exit_code'] = exit_code
                result['success'] = (exit_code == 0)
        
        # Check for errors in stderr
        if stderr and stderr.strip():
            result['success'] = False
            
        return result