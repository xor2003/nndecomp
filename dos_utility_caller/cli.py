#!/usr/bin/env python3
"""
Command-line interface for the DOS Utility Caller.
"""

import argparse
import sys
import os
import json
import logging
from typing import List, Dict, Any
from pathlib import Path

# Add the parent directory to the path so we can import dos_utility_caller
sys.path.insert(0, str(Path(__file__).parent.parent))

from dos_utility_caller import call_dos_utility


def parse_arguments() -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="Call DOS utilities through DOSBox with transparent interface",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s ver
  %(prog)s dir *.txt
  %(prog)s echo Hello World
  %(prog)s cl /c test.c
  %(prog)s --config config.doscfg dir *.txt
        """
    )
    
    parser.add_argument(
        'command',
        help='DOS command to execute'
    )
    
    parser.add_argument(
        'arguments',
        nargs='*',
        help='Arguments for the DOS command'
    )
    
    parser.add_argument(
        '--config',
        '-c',
        type=str,
        help='Path to DOSBox configuration file (.doscfg)'
    )
    
    parser.add_argument(
        '--timeout',
        '-t',
        type=int,
        help='Timeout in seconds (default: 300)'
    )
    
    parser.add_argument(
        '--no-capture',
        action='store_true',
        help='Do not capture output'
    )
    
    parser.add_argument(
        '--working-dir',
        '-w',
        type=str,
        help='Working directory for DOSBox'
    )
    
    parser.add_argument(
        '--env',
        '-e',
        action='append',
        help='Environment variables in KEY=VALUE format (can be used multiple times)'
    )
    
    parser.add_argument(
        '--tool-root',
        type=str,
        help='Path for disk D: (overrides TOOL_ROOT_DIR environment variable)'
    )
    
    parser.add_argument(
        '--json',
        action='store_true',
        help='Output results in JSON format'
    )
    
    parser.add_argument(
        '--debug',
        action='store_true',
        help='Enable debug logging'
    )
    
    return parser.parse_args()


def parse_env_vars(env_args: List[str]) -> Dict[str, str]:
    """Parse environment variables from command-line arguments."""
    env_vars = {}
    if env_args:
        for arg in env_args:
            if '=' in arg:
                key, value = arg.split('=', 1)
                env_vars[key] = value
            else:
                print(f"Warning: Invalid environment variable format: {arg}", file=sys.stderr)
    return env_vars


def load_config(config_path: str) -> Dict[str, Any]:
    """Load DOSBox configuration from file."""
    if not os.path.exists(config_path):
        print(f"Error: Configuration file not found: {config_path}", file=sys.stderr)
        sys.exit(1)
    
    config = {}
    try:
        with open(config_path, 'r') as f:
            # Simple parser for .doscfg files (INI format)
            current_section = None
            for line in f:
                line = line.strip()
                if not line or line.startswith('#'):
                    continue
                if line.startswith('[') and line.endswith(']'):
                    current_section = line[1:-1]
                    config[current_section] = {}
                elif '=' in line and current_section:
                    key, value = line.split('=', 1)
                    config[current_section][key.strip()] = value.strip()
    except Exception as e:
        print(f"Error loading configuration file: {e}", file=sys.stderr)
        sys.exit(1)
    
    return config


def main() -> None:
    """Main function for the CLI."""
    args = parse_arguments()
    
    # Set up logging
    log_level = logging.DEBUG if args.debug else logging.WARNING
    logging.basicConfig(level=log_level, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    logger = logging.getLogger(__name__)
    
    # Set TOOL_ROOT_DIR if provided
    if args.tool_root:
        os.environ['TOOL_ROOT_DIR'] = args.tool_root
    
    # Parse environment variables
    environment = parse_env_vars(args.env)
    
    # Load configuration if provided
    dosbox_config = {}
    if args.config:
        dosbox_config = load_config(args.config)
    
    # Add timeout to configuration if provided
    if args.timeout:
        if 'execution' not in dosbox_config:
            dosbox_config['execution'] = {}
        dosbox_config['execution']['timeout'] = str(args.timeout)
    
    # Log the command being executed
    logger.debug("Executing command: %s %s", args.command, ' '.join(args.arguments))
    logger.debug("Environment variables: %s", environment)
    logger.debug("Configuration: %s", dosbox_config)
    
    # Call the DOS utility
    try:
        result = call_dos_utility(
            command=args.command,
            arguments=args.arguments,
            environment=environment,
            dosbox_config=dosbox_config,
            capture_output=not args.no_capture,
            working_dir=args.working_dir
        )
        
        # Log the result at debug level
        logger.debug("Command result: %s", result)
        
        # Output results
        if args.json:
            print(json.dumps(result, indent=2))
        else:
            logger.debug("Outputting results: stdout=%s, stderr=%s",
                        repr(result['stdout']), repr(result['stderr']))
            if result['stdout']:
                print(result['stdout'], end='')
            if result['stderr']:
                print(result['stderr'], file=sys.stderr, end='')
            if not result['success']:
                print(f"Command failed with exit code {result['exit_code']}", file=sys.stderr)
        
        # Exit with the DOS command's exit code
        logger.debug("Exiting with code: %d", result['exit_code'])
        sys.exit(result['exit_code'])
        
    except Exception as e:
        if args.json:
            print(json.dumps({
                'stdout': '',
                'stderr': str(e),
                'exit_code': 1,
                'success': False
            }, indent=2))
        else:
            print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()