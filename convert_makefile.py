#!/usr/bin/env python3
"""
Script to convert DOS makefiles to modern makefiles or build scripts.
"""

import re
import sys
import os
from pathlib import Path

def parse_dos_makefile(makefile_content):
    """
    Parse a DOS makefile and extract targets, dependencies, and rules.
    """
    lines = makefile_content.split('\n')
    targets = {}
    variables = {}
    rules = []
    
    current_target = None
    current_dependencies = []
    current_commands = []
    
    for line in lines:
        line = line.rstrip()
        
        # Skip empty lines
        if not line.strip():
            continue
            
        # Parse variable assignments
        if '=' in line and not line.startswith('\t') and not line.startswith(' '):
            parts = line.split('=', 1)
            if len(parts) == 2:
                var_name = parts[0].strip()
                var_value = parts[1].strip()
                variables[var_name] = var_value
            continue
            
        # Parse targets (lines that don't start with tab/space)
        if not line.startswith('\t') and not line.startswith(' '):
            # Save previous target if exists
            if current_target:
                targets[current_target] = {
                    'dependencies': current_dependencies,
                    'commands': current_commands
                }
            
            # Parse new target
            parts = line.split(':', 1)
            if len(parts) == 2:
                current_target = parts[0].strip()
                deps = parts[1].strip()
                current_dependencies = deps.split() if deps else []
                current_commands = []
            continue
            
        # Parse commands (lines that start with tab)
        if line.startswith('\t') or line.startswith(' '):
            command = line.strip()
            if current_target:
                current_commands.append(command)
            else:
                rules.append(command)
    
    # Save the last target
    if current_target:
        targets[current_target] = {
            'dependencies': current_dependencies,
            'commands': current_commands
        }
    
    return variables, targets, rules

def substitute_variables(text, variables):
    """
    Substitute variables in text with their values.
    """
    result = text
    for var_name, var_value in variables.items():
        result = result.replace(f"$({var_name})", var_value)
        result = result.replace(f"${var_name}", var_value)
    return result

def convert_to_modern_makefile(variables, targets, rules):
    """
    Convert parsed DOS makefile to a modern makefile.
    """
    output = ["# Modern Makefile converted from DOS makefile", ""]
    
    # Add variables
    for var_name, var_value in variables.items():
        # Substitute variables in variable values
        resolved_value = substitute_variables(var_value, variables)
        output.append(f"{var_name} = {resolved_value}")
    output.append("")
    
    # Add targets
    for target_name, target_info in targets.items():
        dependencies = ' '.join(target_info['dependencies'])
        output.append(f"{target_name}: {dependencies}")
        
        for command in target_info['commands']:
            # Substitute variables in commands
            resolved_command = substitute_variables(command, variables)
            output.append(f"\t{resolved_command}")
        output.append("")
    
    # Add suffix rules
    for rule in rules:
        output.append(f"{rule}")
    
    return '\n'.join(output)

def convert_to_build_script(variables, targets, rules, compiler_type='msc'):
    """
    Convert parsed DOS makefile to a build script.
    """
    output = ["@echo off", ""]
    
    # Add header
    output.append("echo Building project... > BUILD.LOG")
    output.append("")
    
    # Resolve variables
    resolved_variables = {}
    for var_name, var_value in variables.items():
        resolved_variables[var_name] = substitute_variables(var_value, variables)
    
    # Extract suffix rules to understand how to compile source files
    compile_rule = "cl /c /AM $*.c"  # Default compile rule
    for rule in rules:
        if ':' in rule:
            rule_part, command_part = rule.split(':', 1)
            if '.c.obj' in rule_part:
                compile_rule = command_part.strip()
        elif rule.strip() and not rule.startswith("#") and ('cl' in rule or 'CL' in rule):
            # This might be a compile rule without the .c.obj: prefix
            compile_rule = rule.strip()
    
    # Find all source files from targets
    source_files = set()
    
    # First, collect source files from dependencies
    for target_name, target_info in targets.items():
        for dep in target_info['dependencies']:
            if dep.endswith('.c'):
                source_files.add(dep)
    
    # Then, look for source files in object file dependencies
    for target_name, target_info in targets.items():
        if target_name.endswith('.obj'):
            # This is an object file target, find its source
            for dep in target_info['dependencies']:
                if dep.endswith('.c'):
                    source_files.add(dep)
        else:
            # This is an executable target, look at its object dependencies
            for dep in target_info['dependencies']:
                if dep.endswith('.obj'):
                    # Try to find the corresponding .c file
                    source_file = dep.replace('.obj', '.c')
                    source_files.add(source_file)
    
    # Add compilation commands for source files
    for source_file in sorted(source_files):
        obj_file = source_file.replace('.c', '.obj')
        output.append(f"echo Compiling {source_file} >> BUILD.LOG")
        
        # Substitute $*.c with the actual source file
        compile_command = compile_rule.replace('$*.c', source_file)
        output.append(f"{compile_command} >> BUILD.LOG 2>&1")
        output.append("if errorlevel 1 echo Error compiling {source_file} >> BUILD.LOG")
        output.append("")
    
    # Find the main target (first target in the makefile)
    main_target = None
    for target_name in targets:
        main_target = target_name
        break
    
    if main_target:
        target_info = targets[main_target]
        
        # Add link command
        output.append(f"echo Linking {main_target} >> BUILD.LOG")
        for command in target_info['commands']:
            # Substitute variables in commands
            resolved_command = substitute_variables(command, resolved_variables)
            output.append(f"{resolved_command} >> BUILD.LOG 2>&1")
            output.append("if errorlevel 1 echo Error linking >> BUILD.LOG")
            output.append("")
    
    # Add completion message
    output.append("echo Build completed. >> BUILD.LOG")
    
    return '\n'.join(output)

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 convert_makefile.py <makefile> [output_type]")
        print("  output_type: makefile (default) or script")
        return
    
    makefile_path = sys.argv[1]
    output_type = sys.argv[2] if len(sys.argv) > 2 else "makefile"
    
    if not os.path.exists(makefile_path):
        print(f"Error: Makefile '{makefile_path}' not found.")
        return
    
    with open(makefile_path, 'r') as f:
        content = f.read()
    
    variables, targets, rules = parse_dos_makefile(content)
    
    if output_type == "script":
        output = convert_to_build_script(variables, targets, rules)
        output_filename = "BUILD.BAT"
    else:
        output = convert_to_modern_makefile(variables, targets, rules)
        output_filename = "Makefile.modern"
    
    with open(output_filename, 'w') as f:
        f.write(output)
    
    print(f"Converted makefile saved as '{output_filename}'")

if __name__ == "__main__":
    main()