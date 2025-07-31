#!/usr/bin/env python3
import datetime
import os
import shutil
import subprocess
import logging
import configparser
from pathlib import Path

# Setup logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

class BuildToolchain:
    def __init__(self, project_dir, compiler_type):
        self.project_dir = Path(project_dir).resolve()
        self.compiler_type = compiler_type
        self.dosbox_config = self._get_dosbox_config()
        self.mount_path = self._get_mount_path()
        self.artifacts_dir = Path('artifacts') / self.project_dir.name
        
    def _get_dosbox_config(self):
        """Get the appropriate DOSBox configuration file based on compiler type"""
        config_map = {
            'borland': 'borland.conf',
            'turbo': 'turbo.conf',
            'msc': 'msc_working.conf'  # Use the new working configuration
        }
        config_file = config_map.get(self.compiler_type.lower())
        if not config_file:
            raise ValueError(f"Unsupported compiler type: {self.compiler_type}")
        
        # For msc compiler, use the test config file
        if self.compiler_type.lower() == 'msc':
            config_file = 'msc_test.conf'
        
        # Always resolve the path from the project's root directory
        config_path = Path(__file__).parent.resolve() / config_file
        if not config_path.exists():
            raise FileNotFoundError(f"Config file '{config_path}' not found")
        return str(config_path)

    def _get_mount_path(self):
        """Get the base path for the compiler installation"""
        mount_path_map = {
            'borland': '/home/xor/nndecomp/BorlandC',
            'turbo': '/home/xor/nndecomp/tc301',
            'msc': '/home/xor/nndecomp'
        }
        path = mount_path_map.get(self.compiler_type.lower())
        if not path:
            raise ValueError(f"Unsupported compiler type: {self.compiler_type}")
        return path

    def scan_project(self):
        """Scan project directory and identify build files"""
        logging.info(f"Scanning project: {self.project_dir}")
        build_files = []
        
        for root, _, files in os.walk(self.project_dir):
            # Check if cmd.bat exists in this directory
            has_cmd_bat = 'cmd.bat' in [f.lower() for f in files]
            has_makefile = 'makefile' in [f.lower() for f in files]
            
            for file in files:
                # If both cmd.bat and MAKEFILE exist, prioritize MAKEFILE
                if has_cmd_bat and has_makefile:
                    if file.lower() == 'makefile' or file.lower().endswith('.prj'):
                        build_files.append(Path(root) / file)
                # If only cmd.bat exists, include cmd.bat and .prj files
                elif has_cmd_bat:
                    if file.lower() == 'cmd.bat' or file.lower().endswith('.prj'):
                        build_files.append(Path(root) / file)
                # If no cmd.bat, include all standard build files
                else:
                    if file.lower().endswith('.prj') or file.lower() == 'makefile' or file.lower().endswith('.bat'):
                        build_files.append(Path(root) / file)
        
        logging.info(f"Found {len(build_files)} build files")
        return build_files

    def execute_build(self, build_files):
        """Execute build process using DOSBox with centralized build.bat"""
        compiler_cmd = ""
        logging.info(f"Starting build with {self.compiler_type} using {self.dosbox_config}")
        logging.info(f"Mount path: {self.mount_path}")
        logging.info(f"Project directory: {self.project_dir}")
        logging.info(f"Found build files: {[str(f) for f in build_files]}")
        
        # Create artifacts directory
        self.artifacts_dir.mkdir(parents=True, exist_ok=True)
        
        # Create log file for DOSBox output
        dosbox_log = self.artifacts_dir / 'dosbox.log'
        
        # No specific batch file needed for direct command execution
        logging.info("Executing DOSBox commands with output redirection")
        
        # Build DOSBox command
        cmd = [
            'dosbox',
            '-conf', self.dosbox_config,
            '--exit'
        ]
        
        # Log the DOSBox command
        logging.info(f"DOSBox command: {' '.join(cmd)}")
        
        # Execute build
        try:
            # Run headlessly with output redirection
            logging.info("Executing DOSBox build command...")
            result = subprocess.run(
                cmd,
                cwd=str(self.project_dir),
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                check=False
            )
            # Write output to log file
            with open(dosbox_log, 'w') as log_f:
                log_f.write(f"STDOUT:\n{result.stdout}\n\nSTDERR:\n{result.stderr}\n")
            logging.info(f"DOSBox execution completed with return code: {result.returncode}")
            logging.info(f"DOSBox stdout: {result.stdout}")
            logging.info(f"DOSBox stderr: {result.stderr}")
            result.stdout = result.stdout or ""
            result.stderr = result.stderr or ""

            # Always try to collect artifacts, even if build failed
            # Print environment variables (using root path)
            env_file = Path(self.project_dir) / 'env_vars.txt'
            if env_file.exists():
                logging.info(f"Environment variables captured in DOSBox:\n{env_file.read_text()}")
            
            # Check for build output files
            
            # If DOSBox failed, raise the exception
            if result.returncode != 0:
                logging.error(f"DOSBox failed with return code {result.returncode}")
                raise subprocess.CalledProcessError(result.returncode, cmd, result.stdout, result.stderr)
            
            logging.info("Build executed successfully")
            return result.stdout
        except subprocess.CalledProcessError as e:
            logging.error(f"DOSBox execution failed with return code {e.returncode}")
            logging.error(f"DOSBox stdout: {e.stdout}")
            logging.error(f"DOSBox stderr: {e.stderr}")
            
            # Print environment variables if available
            env_file = Path(self.project_dir) / 'env_vars.txt'
            if env_file.exists():
                logging.error(f"Environment variables captured in DOSBox:\n{env_file.read_text()}")
            
            # Check for build output files even on failure
            
            # Check if error indicates missing compiler
            error_output = f"{e.stdout}\n{e.stderr}"
            if "command not found" in error_output or "Bad command or file name" in error_output:
                logging.error(f"Compiler '{compiler_cmd}' not found in DOS environment")
            else:
                logging.error(f"Build failed: {error_output}")
            raise

    def collect_artifacts(self, build_output):
        """Collect build artifacts and source files"""
        logging.info(f"Collecting artifacts to {self.artifacts_dir}")
        
        # Save build log
        (self.artifacts_dir / 'build.log').write_text(build_output)
        
        # Create logs directory for build outputs
        logs_dir = self.artifacts_dir / 'logs'
        logs_dir.mkdir(exist_ok=True)
        
        # Copy build logs, outputs, errorlevel files, and text files
        # Check for both lowercase and uppercase versions due to DOSBox case sensitivity issues
        for pattern in ['*.LOG', '*.log', '*.OUT', '*.out', '*.ERR', '*.err', '*.ERL', '*.erl', '*.TXT', '*.txt']:
            for file in self.project_dir.glob(pattern):
                if file.is_file():
                    file.chmod(0o666)
                    shutil.copy(file, logs_dir / file.name)
        
        # Copy source files and binaries with proper permissions
        for file in self.project_dir.glob('**/*'):
            if file.is_file():
                # Make file writable before copying
                file.chmod(0o666)
                dest = self.artifacts_dir / 'sources' / file.name
                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy(file, dest)
                
        # Copy binaries
        bin_dir = self.artifacts_dir / 'binaries'
        bin_dir.mkdir(exist_ok=True)
        binaries_found = False
        # Check for both lowercase and uppercase extensions due to DOSBox case sensitivity issues
        for pattern in ['*.EXE', '*.exe', '*.COM', '*.com', '*.OBJ', '*.obj']:
            for file in self.project_dir.glob(f'**/{pattern}'):
                # Make file writable before copying
                file.chmod(0o666)
                shutil.copy(file, bin_dir / file.name)
                binaries_found = True
        
        # Verify artifacts were created
        if not binaries_found:
            logging.error("No binaries found after build!")
        else:
            # Check for errorlevel files in any case
            # Check for errorlevel files (both uppercase and lowercase)
            erl_files = list(logs_dir.glob('*.ERL')) + list(logs_dir.glob('*.erl'))
            if not erl_files:
                logging.error("No errorlevel files captured!")
            else:
                logging.info(f"Found {len(erl_files)} errorlevel files")
                logging.info("Build artifacts verified successfully")
        
        logging.info(f"Artifacts collected: {len(list(self.artifacts_dir.glob('**/*')))} files")

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description='DOSBox Build Toolchain')
    parser.add_argument('project_dir', help='Path to project directory')
    parser.add_argument('compiler', choices=['borland', 'turbo', 'msc'], help='Compiler type')
    
    args = parser.parse_args()
    
    toolchain = BuildToolchain(args.project_dir, args.compiler)
    build_files = toolchain.scan_project()
    
    if build_files:
        try:
            output = toolchain.execute_build(build_files)
            toolchain.collect_artifacts(output)
        except Exception as e:
            logging.error(f"Build process failed: {str(e)}")
    else:
        logging.warning("No build files found. Nothing to build.")
