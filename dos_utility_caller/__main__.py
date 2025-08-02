"""
Main entry point for the DOS Utility Caller package.
"""

import sys
from .dos_caller import call_dos_utility


def main():
    """Main function for command-line usage."""
    if len(sys.argv) < 2:
        print("Usage: python -m dos_utility_caller <command> [arguments...]")
        print("Example: python -m dos_utility_caller dir *.txt")
        sys.exit(1)
    
    command = sys.argv[1]
    arguments = sys.argv[2:] if len(sys.argv) > 2 else []
    
    # For now, we'll just print a message since we don't want to actually
    # execute DOS commands when running this as a module
    print(f"Would execute: {command} {' '.join(arguments)}")
    print("Use the call_dos_utility function in your code for actual execution.")


if __name__ == "__main__":
    main()