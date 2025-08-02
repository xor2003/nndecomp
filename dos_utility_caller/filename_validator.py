"""
Filename Validator for DOS Utility Caller

Enforces strict DOS 8.3 filename compatibility and provides case warnings.
"""

import re
from typing import List


class FilenameValidationError(Exception):
    """Exception raised for invalid DOS filenames."""
    pass


class FilenameValidator:
    """Validates filename compatibility with DOS 8.3 naming convention."""
    
    @staticmethod
    def validate_dos_filename(filename: str) -> bool:
        """
        Validate filename compatibility with DOS 8.3 naming convention.
        Raises exception if filename is incompatible.
        
        Args:
            filename: Filename to validate
            
        Returns:
            True if filename is valid
            
        Raises:
            FilenameValidationError: If filename is incompatible with DOS 8.3
        """
        # Check if filename exceeds 8.3 format
        name_parts = filename.split('.')
        if len(name_parts) > 2:
            raise FilenameValidationError(
                f"Filename '{filename}' has too many dots for DOS 8.3 format"
            )
        
        name = name_parts[0]
        ext = name_parts[1] if len(name_parts) > 1 else ""
        
        if len(name) > 8:
            raise FilenameValidationError(
                f"Filename '{filename}' base name exceeds 8 characters"
            )
        
        if len(ext) > 3:
            raise FilenameValidationError(
                f"Filename '{filename}' extension exceeds 3 characters"
            )
        
        # Check for invalid characters (excluding wildcard characters)
        invalid_chars = ['<', '>', ':', '"', '/', '\\', '|', '?']
        for char in invalid_chars:
            if char in filename:
                raise FilenameValidationError(
                    f"Filename '{filename}' contains invalid character '{char}'"
                )
        
        # Check for reserved names in DOS
        reserved_names = [
            'CON', 'PRN', 'AUX', 'NUL',
            'COM1', 'COM2', 'COM3', 'COM4', 'COM5', 'COM6', 'COM7', 'COM8', 'COM9',
            'LPT1', 'LPT2', 'LPT3', 'LPT4', 'LPT5', 'LPT6', 'LPT7', 'LPT8', 'LPT9'
        ]
        
        name_upper = name.upper()
        if name_upper in reserved_names:
            raise FilenameValidationError(
                f"Filename '{filename}' is a reserved DOS device name"
            )
        
        return True
    
    @staticmethod
    def validate_filenames(filenames: List[str]) -> bool:
        """
        Validate a list of filenames.
        
        Args:
            filenames: List of filenames to validate
            
        Returns:
            True if all filenames are valid
            
        Raises:
            FilenameValidationError: If any filename is incompatible
        """
        for filename in filenames:
            FilenameValidator.validate_dos_filename(filename)
        return True
    
    @staticmethod
    def check_case_warnings(filenames: List[str]) -> List[str]:
        """
        Check for case-related warnings in filenames.
        
        Args:
            filenames: List of filenames to check
            
        Returns:
            List of warning messages
        """
        warnings = []
        for filename in filenames:
            if filename != filename.upper():
                warnings.append(
                    f"Filename '{filename}' will be converted to uppercase in DOS"
                )
        return warnings