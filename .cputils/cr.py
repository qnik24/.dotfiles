#!/usr/bin/env python3

import argparse
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(
        prog="cr",
        description="Compile and run a C++ program."
    )
    parser.add_argument("source", type=Path, help="C++ source file")
    args = parser.parse_args()

    source = args.source

    # Allow both 'cr A' and 'cr A.cpp'.
    if not source.suffix:
        source = source.with_suffix(".cpp")

    if not source.is_file():
        parser.error(f"source file not found: {source}")

    compiler = shutil.which("g++")
    if compiler is None:
        parser.error("g++ not found in PATH")

    # Build the executable in a temporary directory.
    with tempfile.TemporaryDirectory() as directory:
        executable = Path(directory) / (
            "program.exe" if sys.platform == "win32" else "program"
        )

        compile_result = subprocess.run([
            compiler,
            "-std=c++20",
            "-O2",
            "-Wall",
            "-Wextra",
            str(source),
            "-o",
            str(executable)
        ])

        if compile_result.returncode != 0:
            return compile_result.returncode

        # Inherit stdin, stdout and stderr from the terminal.
        try:
            result = subprocess.run([str(executable)])
        except KeyboardInterrupt:
            return 130

        return result.returncode


if __name__ == "__main__":
    sys.exit(main())
