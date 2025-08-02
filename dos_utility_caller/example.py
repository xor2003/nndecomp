#!/usr/bin/env python3
"""
Example usage of the DOS Utility Caller.
"""

import sys
import os
from pathlib import Path

# Add the parent directory to the path so we can import dos_utility_caller
sys.path.insert(0, str(Path(__file__).parent.parent))

from dos_utility_caller import call_dos_utility


def example_simple_command():
    """Example of executing a simple DOS command."""
    print("=== Simple Command Example ===")
    
    # Set TOOL_ROOT_DIR environment variable
    import os
    os.environ['TOOL_ROOT_DIR'] = '/home/xor/nndecomp/msc60'
    
    result = call_dos_utility(
        command="ver"
        # No arguments needed for ver command
    )
    
    print(f"Exit code: {result['exit_code']}")
    print(f"Success: {result['success']}")
    print(f"Output:\n{result['stdout']}")
    
    if result['stderr']:
        print(f"Errors:\n{result['stderr']}")


def example_compilation():
    """Example of compiling a C file with Microsoft C."""
    print("\n=== Compilation Example ===")
    
    # Set TOOL_ROOT_DIR environment variable
    os.environ['TOOL_ROOT_DIR'] = '/home/xor/nndecomp/msc60'
    
    result = call_dos_utility(
        command="ver"
        # No arguments needed for ver command
    )
    
    print(f"Exit code: {result['exit_code']}")
    print(f"Success: {result['success']}")
    print(f"Output:\n{result['stdout']}")
    
    if result['stderr']:
        print(f"Errors:\n{result['stderr']}")


def example_custom_config():
    """Example of using custom DOSBox configuration."""
    print("\n=== Custom Configuration Example ===")
    
    result = call_dos_utility(
        command="echo",
        arguments=["Custom config test"],
        dosbox_config={
            "dosbox": {"memsize": "32"},
            "cpu": {"cycles": "30000"},
            "execution": {"timeout": "10"}  # 10 seconds timeout for faster testing
        }
    )
    
    print(f"Exit code: {result['exit_code']}")
    print(f"Success: {result['success']}")
    print(f"Output:\n{result['stdout']}")


if __name__ == "__main__":
    # Check if DOSBox is installed
    if os.system("which dosbox > /dev/null 2>&1") != 0:
        print("DOSBox is not installed. Please install it first:")
        print("  sudo apt-get install dosbox  # Ubuntu/Debian")
        print("  brew install dosbox          # macOS")
        sys.exit(1)
    
    # Run examples
    example_simple_command()
    example_compilation()
    example_custom_config()
    
    print("\n=== All examples completed ===")