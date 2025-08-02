# DOS Utility Caller

A Python library for transparently calling DOS utilities through DOSBox, providing a native-like interface for executing DOS commands with proper argument passing, environment handling, and output capture.

## Overview

This tool provides a seamless interface for executing DOS commands as if they were native Linux commands, handling all the complexity of DOSBox configuration, environment setup, and output capture behind the scenes.

## Features

- **Transparent Interface**: Call DOS utilities as if they were native commands
- **Environment Handling**: Automatic translation of environment variables to DOS format
- **Output Capture**: Captures stdout, stderr, and exit codes
- **Filename Validation**: Enforces strict DOS 8.3 filename compatibility
- **Flexible Configuration**: Customizable DOSBox settings and mount points
- **Process Timeout**: Configurable timeout to prevent DOSBox from freezing (default 5 minutes)
- **Automatic Mounting**: Disk C: mounted to current directory, Disk D: mounted to TOOL_ROOT_DIR environment variable
- **Error Handling**: Comprehensive error reporting and handling

## Installation

```bash
# Install DOSBox first
sudo apt-get install dosbox  # Ubuntu/Debian
# or
brew install dosbox  # macOS

# Then install this package
pip install dos_utility_caller
```

## Usage

### Simple Command Execution

```python
from dos_utility_caller import call_dos_utility

# Set the TOOL_ROOT_DIR environment variable
import os
os.environ['TOOL_ROOT_DIR'] = '/path/to/tools'

# Execute a simple DOS command
# Disk C: will be mounted to the current directory
# Disk D: will be mounted to the path specified in TOOL_ROOT_DIR
result = call_dos_utility(
    command="dir",
    arguments=["*.txt"]
    # source_dir and tools_dir are not needed as they will use the current directory
    # and TOOL_ROOT_DIR environment variable respectively
)

print(f"Exit code: {result['exit_code']}")
print(f"Success: {result['success']}")
print(f"Output: {result['stdout']}")
```

### Compilation with Microsoft C

```python
from dos_utility_caller import call_dos_utility

# Set the TOOL_ROOT_DIR environment variable
os.environ['TOOL_ROOT_DIR'] = '/home/user/msc60'

# Compile a C file with Microsoft C
# Disk C: will be mounted to the current directory (where test.c is located)
# Disk D: will be mounted to the path specified in TOOL_ROOT_DIR
result = call_dos_utility(
    command="d:\\bin\\cl",
    arguments=["/c", "/AS", "/Fc", "test.c"],
    environment={
        "PATH": "%PATH%;D:\\BIN",
        "INCLUDE": "D:\\INCLUDE",
        "LIB": "D:\\LIB"
    }
)

if result['success']:
    print("Compilation successful")
else:
    print(f"Compilation failed: {result['stderr']}")
```

### Using Custom DOSBox Configuration

```python
from dos_utility_caller import call_dos_utility

# Execute with custom DOSBox settings
result = call_dos_utility(
    command="myapp",
    arguments=["param1", "param2"],
    dosbox_config={
        "dosbox": {"memsize": "32"},
        "cpu": {"cycles": "30000"}
    }
)
```

## API Reference

### `call_dos_utility()`

Main function for executing DOS commands.

#### Parameters

- `command` (str): DOS command to execute
- `arguments` (List[str], optional): Command arguments
- `environment` (Dict[str, str], optional): Additional environment variables
- `dosbox_config` (Dict[str, Any], optional): DOSBox configuration overrides
- `capture_output` (bool, optional): Whether to capture output (default: True)
- `working_dir` (str, optional): Working directory for DOSBox

Note: The `source_dir` and `tools_dir` parameters are deprecated. Disk C: is automatically mounted to the current directory, and disk D: is mounted to the path specified in the `TOOL_ROOT_DIR` environment variable.

#### Returns

```python
{
    'stdout': str,      # Standard output
    'stderr': str,      # Standard error
    'exit_code': int,   # Exit code
    'success': bool     # Success status
}
```

## Components

### Configuration Manager
Handles DOSBox configuration, environment variables, and mount points.

### Batch File Generator
Generates DOS batch files with dynamic variable substitution.

### DOSBox Executor
Executes DOS commands through DOSBox.

### Output Handler
Captures and processes DOS command output.

### Filename Validator
Enforces strict DOS 8.3 filename compatibility.

## Automatic Mounting

By default, the tool automatically mounts directories:

- **Disk C:** is mounted to the current Linux directory
- **Disk D:** is mounted to the path specified in the `TOOL_ROOT_DIR` environment variable

You can set the `TOOL_ROOT_DIR` environment variable before calling the tool:

```bash
export TOOL_ROOT_DIR=/path/to/your/tools
```

Or set it in your Python code:

```python
import os
os.environ['TOOL_ROOT_DIR'] = '/path/to/your/tools'
```

## Environment Variable Translation

The tool automatically translates Unix-style paths to DOS-style paths for environment variables when they relate to mounted directories. This translation happens automatically based on the current mount points:

- Unix path: `/home/user/msc60/bin` → DOS path: `D:\BIN` (if D: is mounted to /home/user/msc60)
- Unix path: `/home/user/project/src` → DOS path: `C:\SRC` (if C: is mounted to /home/user/project)

This translation works for any environment variable that contains paths, including PATH, INCLUDE, LIB, and custom variables.

## Process Timeout

To prevent DOSBox processes from hanging indefinitely, the tool implements a configurable timeout mechanism:

- **Default timeout**: 5 minutes (300 seconds)
- **Configuration**: Can be changed in the `[execution]` section of the configuration file
- **Environment variable**: Can be set in the `timeout` parameter in the `dosbox_config` parameter when calling `call_dos_utility`

Example of setting a custom timeout:

```python
result = call_dos_utility(
    command="long_running_command",
    dosbox_config={
        "execution": {"timeout": "600"}  # 10 minutes
    }
)
```

If a DOSBox process exceeds the timeout, a `DOSBoxExecutionError` will be raised with a message indicating the timeout.

## Error Handling

The tool provides comprehensive error handling:

- **FilenameValidationError**: For DOS 8.3 filename compatibility issues
- **DOSBoxExecutionError**: For DOSBox execution problems
- General exceptions for unexpected errors

All errors are captured and returned in the result dictionary for consistent error handling.

## Testing

Run the unit tests with:

```bash
python -m unittest dos_utility_caller.test_dos_caller
```

## License

MIT License

## Command-Line Interface

The DOS Utility Caller also provides a command-line interface for direct usage from the terminal:

```bash
# Basic usage
python -m dos_utility_caller.cli ver
python -m dos_utility_caller.cli dir *.txt
python -m dos_utility_caller.cli echo Hello World

# After installing the package, you can also use:
doscall ver
doscall dir *.txt
doscall echo Hello World

# With custom configuration
python -m dos_utility_caller.cli --config myconfig.doscfg dir *.txt

# With environment variables
python -m dos_utility_caller.cli --env PATH=D:\\BIN --env INCLUDE=D:\\INCLUDE cl /c test.c

# With timeout
python -m dos_utility_caller.cli --timeout 60 long_running_command

# JSON output
python -m dos_utility_caller.cli --json ver

# Debug logging
python -m dos_utility_caller.cli --debug ver
```

### CLI Options

- `command`: DOS command to execute
- `arguments`: Arguments for the DOS command
- `--config`, `-c`: Path to DOSBox configuration file (.doscfg)
- `--timeout`, `-t`: Timeout in seconds (default: 300)
- `--no-capture`: Do not capture output
- `--working-dir`, `-w`: Working directory for DOSBox
- `--env`, `-e`: Environment variables in KEY=VALUE format (can be used multiple times)
- `--tool-root`: Path for disk D: (overrides TOOL_ROOT_DIR environment variable)
- `--json`: Output results in JSON format
- `--debug`: Enable debug logging

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.