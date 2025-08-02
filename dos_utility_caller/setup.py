from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setup(
    name="dos_utility_caller",
    version="1.0.0",
    author="DOS Utility Caller Team",
    author_email="example@example.com",
    description="A Python library for transparently calling DOS utilities through DOSBox",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/example/dos_utility_caller",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Topic :: System :: Emulators",
    ],
    python_requires=">=3.8",
    install_requires=[
        # No external dependencies required
    ],
    extras_require={
        "dev": [
            "pytest>=6.0",
            "pytest-cov>=2.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "doscall=dos_utility_caller.cli:main",
        ],
    },
)