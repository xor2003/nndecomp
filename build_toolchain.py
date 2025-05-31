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
            'msc': 'msc.conf'
        }
        config_file = config_map.get(self.compiler_type.lower())
        if not config_file or not Path(config_file).exists():
            raise FileNotFoundError(f"Config for {self.compiler_type} not found")
        return config_file

    def _get_mount_path(self):
        """Get the base path for the compiler installation"""
        mount_path_map = {
            'borland': '/home/xor/nndecomp/BorlandC',
            'turbo': '/home/xor/nndecomp/tc301',
            'msc': '/home/xor/nndecomp/msdos'
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
            for file in files:
                if file.lower().endswith('.prj') or file.lower() == 'makefile' or file.lower().endswith('.bat'):
                    build_files.append(Path(root) / file)
        
        logging.info(f"Found {len(build_files)} build files")
        return build_files

    def execute_build(self, build_files):
        """Execute build process using DOSBox with centralized build.bat"""
        logging.info(f"Starting build with {self.compiler_type} using {self.dosbox_config}")
        
        # Create artifacts directory
        self.artifacts_dir.mkdir(parents=True, exist_ok=True)
        
        # Create build.bat in project directory
        build_bat = self.project_dir / 'BUILD2.BAT'
        with open(build_bat, 'w') as f:
            f.write("@echo off\n")
            f.write("echo [INFO] Dumping environment variables...\n")
            f.write("set > env_vars.txt\n")
            
            compiler_map = {
                'borland': 'bcc',
                'turbo': 'tc',
                'msc': 'cl'
            }
            compiler_cmd = compiler_map.get(self.compiler_type.lower(), 'bcc')
            
            for build_file in build_files:
                build_file_low = str(build_file).lower()
                if "build1.bat" in build_file_low or "build2.bat" in build_file_low:
                    continue
                
                errlvl_file = f'{build_file.stem}.ERL'
                
                if build_file.suffix.lower() == '.prj':
                    cmd_str = f'{compiler_cmd} @{build_file.name}'
                    f.write(f"echo [CMD] {cmd_str}\n")
                    f.write(f"{cmd_str}\n")
                    f.write(f"errorlvl.com > {errlvl_file}\n")
                elif build_file.name.lower() == 'makefile':
                    f.write(f"echo [CMD] make\n")
                    f.write(f"make\n")
                    f.write(f"errorlvl.com > {errlvl_file}\n")
                elif build_file.suffix.lower() == '.bat':
                    f.write(f"echo [CMD] {build_file.name}\n")
                    f.write(f"{build_file.name}\n")
                    f.write(f"errorlvl.com > {errlvl_file}\n")
            
            f.write("exit\n")
        
        log_file = 'BUILD2.OUT'
        err_file = 'BUILD2.ERR'
        # Create run_build.bat that redirects output
        run_build_bat = self.project_dir / 'BUILD1.BAT'
        with open(run_build_bat, 'w') as f:
            f.write(f"BUILD2.BAT >{log_file} 2>{err_file}\n")
            #f.write(f"exit\n")
        
        # Build DOSBox command
        cmd = [
            'dosbox',
            '-conf', self.dosbox_config,
            '-c', f'mount c {self.mount_path}',
            '-c', f'mount d {self.project_dir}',
            '-c', 'set PATH=c:\\bin',
            '-c', 'set INCLUDE=c:\\include',
            '-c', 'set LIB=c:\\lib',
            '-c', 'd:',
            '-c', "call BUILD1.BAT",
            '-c', 'exit'
        ]
        
        # Log the DOSBox command
        logging.info(f"DOSBox command: {' '.join(cmd)}")
        
        # Execute build
        try:
            result = subprocess.run(
                cmd,
                cwd=self.project_dir,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                check=True
            )
            logging.info("Build executed successfully")
            
            # Print environment variables (using root path)
            env_file = Path(self.project_dir) / 'env_vars.txt'
            if env_file.exists():
                logging.info(f"Environment variables:\n{env_file.read_text()}")
            
            return result.stdout
        except subprocess.CalledProcessError as e:
            # Print environment variables if available
            env_file = Path(self.project_dir) / 'env_vars.txt'
            if env_file.exists():
                logging.error(f"Environment variables:\n{env_file.read_text()}")
            
            # Check if error indicates missing compiler
            if "command not found" in e.stderr or "Bad command or file name" in e.stderr:
                logging.error(f"Compiler '{compiler_cmd}' not found in DOS environment")
            else:
                logging.error(f"Build failed: {e.stderr}")
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
        for pattern in ['*.LOG', '*.OUT', '*.ERR', '*.ERL', '*.TXT']:
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
        for pattern in ['*.EXE', '*.COM', '*.OBJ']:
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
            erl_files = list(logs_dir.glob('*.[Ee][Rr][Ll]'))
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