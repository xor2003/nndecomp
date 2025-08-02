"""
Unit tests for the DOS Utility Caller.
"""

import unittest
import tempfile
import os
from pathlib import Path

# Import our modules
try:
    from .dos_caller import call_dos_utility
    from .config_manager import ConfigManager
    from .batch_generator import BatchGenerator
    from .dosbox_executor import DOSBoxExecutor
    from .output_handler import OutputHandler
    from .filename_validator import FilenameValidator, FilenameValidationError
except ImportError:
    # Fallback for direct execution
    import sys
    sys.path.insert(0, str(Path(__file__).parent))
    from dos_caller import call_dos_utility
    from config_manager import ConfigManager
    from batch_generator import BatchGenerator
    from dosbox_executor import DOSBoxExecutor
    from output_handler import OutputHandler
    from filename_validator import FilenameValidator, FilenameValidationError


class TestFilenameValidator(unittest.TestCase):
    """Test cases for the FilenameValidator class."""
    
    def test_valid_filenames(self):
        """Test that valid filenames pass validation."""
        valid_filenames = [
            "test.txt",
            "file.bat",
            "program.exe",
            "a.b",
            "12345678.123",
            "*.txt",
            "test*.bat"
        ]
        
        for filename in valid_filenames:
            with self.subTest(filename=filename):
                self.assertTrue(FilenameValidator.validate_dos_filename(filename))
    
    def test_invalid_filenames(self):
        """Test that invalid filenames fail validation."""
        invalid_cases = [
            ("test12345.txt", "base name exceeds 8 characters"),
            ("test.1234", "extension exceeds 3 characters"),
            ("test.txt.bak", "too many dots"),
            ("CON.txt", "reserved dos device name")
        ]
        
        for filename, expected_error in invalid_cases:
            with self.subTest(filename=filename):
                with self.assertRaises(FilenameValidationError) as context:
                    FilenameValidator.validate_dos_filename(filename)
                self.assertIn(expected_error, str(context.exception).lower())
        
        # Test invalid characters separately since they might fail on length check first
        with self.subTest(filename="t<est.txt"):
            with self.assertRaises(FilenameValidationError) as context:
                FilenameValidator.validate_dos_filename("t<est.txt")
            self.assertIn("contains invalid character", str(context.exception).lower())
        
        for filename, expected_error in invalid_cases:
            with self.subTest(filename=filename):
                with self.assertRaises(FilenameValidationError) as context:
                    FilenameValidator.validate_dos_filename(filename)
                self.assertIn(expected_error, str(context.exception).lower())
    
    def test_case_warnings(self):
        """Test case warning functionality."""
        filenames = ["Test.txt", "file.BAT", "PROGRAM.exe"]
        warnings = FilenameValidator.check_case_warnings(filenames)
        self.assertEqual(len(warnings), 3)
        
        # Test with uppercase filenames (should produce no warnings)
        filenames = ["TEST.TXT", "FILE.BAT", "PROGRAM.EXE"]
        warnings = FilenameValidator.check_case_warnings(filenames)
        self.assertEqual(len(warnings), 0)


class TestConfigManager(unittest.TestCase):
    """Test cases for the ConfigManager class."""
    
    def test_default_config(self):
        """Test that default configuration is set correctly."""
        config_manager = ConfigManager()
        config = config_manager.get_dosbox_config()
        
        # Check that expected sections exist
        self.assertIn('sdl', config)
        self.assertIn('dosbox', config)
        self.assertIn('cpu', config)
        self.assertIn('mount', config)
        
        # Check specific values
        self.assertEqual(config['sdl']['fullscreen'], 'false')
        self.assertEqual(config['dosbox']['machine'], 'svga_s3')
        self.assertEqual(config['cpu']['cycles'], '20000')
    
    def test_config_updates(self):
        """Test that configuration updates work correctly."""
        config_manager = ConfigManager()
        
        # Update configuration
        updates = {
            'dosbox': {'memsize': '32'},
            'cpu': {'cycles': '30000'}
        }
        config_manager.update_config(updates)
        
        # Check updated values
        config = config_manager.get_dosbox_config()
        self.assertEqual(config['dosbox']['memsize'], '32')
        self.assertEqual(config['cpu']['cycles'], '30000')


class TestBatchGenerator(unittest.TestCase):
    """Test cases for the BatchGenerator class."""
    
    def test_simple_batch_generation(self):
        """Test generation of simple batch files."""
        generator = BatchGenerator()
        batch_file = generator.generate_simple_batch("dir", ["*.txt"])
        
        # Check that file was created
        self.assertTrue(os.path.exists(batch_file))
        
        # Check content
        with open(batch_file, 'r') as f:
            content = f.read()
            self.assertIn("dir *.txt", content)
            self.assertIn("stdout.txt", content)
            self.assertIn("stderr.txt", content)
        
        # Clean up
        os.remove(batch_file)
    
    def test_compilation_batch_generation(self):
        """Test generation of compilation batch files."""
        generator = BatchGenerator()
        batch_file = generator.generate_compilation_batch(
            "cl", ["/c", "test.c"], "Microsoft C", "test.obj"
        )
        
        # Check that file was created
        self.assertTrue(os.path.exists(batch_file))
        
        # Check content
        with open(batch_file, 'r') as f:
            content = f.read()
            self.assertIn("cl /c test.c", content)
            self.assertIn("test.obj created successfully", content)
            self.assertIn("dir *.OBJ", content)
        
        # Clean up
        os.remove(batch_file)
    
    def test_8_3_filename_compliance(self):
        """Test that generated batch files have 8.3 compliant names."""
        generator = BatchGenerator()
        batch_file = generator.generate_simple_batch("dir", ["*.txt"])
        
        # Check that file was created
        self.assertTrue(os.path.exists(batch_file))
        
        # Check 8.3 compliance
        filename = os.path.basename(batch_file)
        name_parts = filename.split('.')
        
        # Should have exactly one dot separating name and extension
        self.assertEqual(len(name_parts), 2)
        
        # Name part should be 8 characters or less
        self.assertLessEqual(len(name_parts[0]), 8)
        
        # Extension should be 3 characters or less
        self.assertLessEqual(len(name_parts[1]), 3)
        
        # Both name and extension should contain only alphanumeric characters
        self.assertTrue(name_parts[0].isalnum())
        self.assertTrue(name_parts[1].isalnum())
        
        # Clean up
        os.remove(batch_file)


class TestOutputHandler(unittest.TestCase):
    """Test cases for the OutputHandler class."""
    
    def test_exit_code_extraction(self):
        """Test extraction of exit codes from output."""
        handler = OutputHandler()
        
        # Test valid exit code
        output = "Some command output\nExit code: 0\nMore output"
        exit_code = handler.extract_exit_code(output)
        self.assertEqual(exit_code, 0)
        
        # Test no exit code
        output = "Some command output\nMore output"
        exit_code = handler.extract_exit_code(output)
        self.assertIsNone(exit_code)
    
    def test_output_processing(self):
        """Test processing of command output."""
        handler = OutputHandler()
        
        # Test successful execution
        result = handler.process_output("Exit code: 0\n", "")
        self.assertTrue(result['success'])
        self.assertEqual(result['exit_code'], 0)
        
        # Test failed execution
        result = handler.process_output("Exit code: 1\n", "Error occurred")
        self.assertFalse(result['success'])
        self.assertEqual(result['exit_code'], 1)


class TestDOSCallerIntegration(unittest.TestCase):
    """Integration test cases for the main DOS caller function."""
    
    def test_function_signature(self):
        """Test that the main function has the correct signature."""
        # This is a basic test to ensure the function exists and is callable
        self.assertTrue(callable(call_dos_utility))


if __name__ == '__main__':
    unittest.main()