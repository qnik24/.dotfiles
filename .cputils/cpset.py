#!/usr/bin/env python3
"""Create competitive programming contest directories and solution files."""

import argparse
import shutil
import string
import sys
from pathlib import Path

TEMPLATE_DIR = Path(__file__).resolve().parent / ".template_dir"
TEMPLATE_FILE = TEMPLATE_DIR / "SOLUTION_TEMPLATE.cpp"
PROBLEMS = string.ascii_uppercase


def nonnegative_int(value: str) -> int:
    try:
        number = int(value)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("must be an integer") from exc
    if number < 0:
        raise argparse.ArgumentTypeError("must be nonnegative")
    return number


def positive_int(value: str) -> int:
    number = nonnegative_int(value)
    if number == 0:
        raise argparse.ArgumentTypeError("must be positive")
    return number


def validate_template() -> None:
    if not TEMPLATE_DIR.is_dir():
        raise ValueError(f"template directory does not exist: {TEMPLATE_DIR}")
    if not TEMPLATE_FILE.is_file():
        raise ValueError(f"solution template does not exist: {TEMPLATE_FILE}")
    if not (TEMPLATE_DIR / "bits").is_dir():
        raise ValueError(f"template must contain a bits/ directory: {TEMPLATE_DIR}")


def add_files(directory: Path, labels: str) -> None:
    for label in labels:
        destination = directory / f"{label}.cpp"
        # Exclusive creation avoids accidentally replacing a solution.
        with destination.open("xb") as output, TEMPLATE_FILE.open("rb") as source:
            shutil.copyfileobj(source, output)


def create_contest(args: argparse.Namespace) -> None:
    directory = Path(args.contest_name)
    if directory.exists():
        raise ValueError(f"destination already exists: {directory}")
    if args.n > len(PROBLEMS):
        raise ValueError("at most 26 solution files are supported")
    validate_template()

    # copytree fails if the destination already exists, including in races.
    shutil.copytree(TEMPLATE_DIR, directory)
    (directory / TEMPLATE_FILE.name).unlink()
    add_files(directory, PROBLEMS[:args.n])
    print(f"Created {directory} with {args.n} solution file(s).")


def add_solutions(args: argparse.Namespace) -> None:
    directory = Path.cwd()
    if not (directory / "bits").is_dir():
        raise ValueError("current directory is not a contest directory (missing 'bits/')")
    validate_template()

    available = [label for label in PROBLEMS if not (directory / f"{label}.cpp").exists()]
    if args.n > len(available):
        raise ValueError(f"only {len(available)} unused solution name(s) remain")

    labels = "".join(available[:args.n])
    add_files(directory, labels)
    print(f"Created: {', '.join(f'{label}.cpp' for label in labels)}")


def main() -> int:
    parser = argparse.ArgumentParser(
        prog="cpset",
        description="Manage competitive programming contest templates.",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    create = subparsers.add_parser("create", aliases=["c"], help="create a contest directory")
    create.add_argument("contest_name", help="destination directory")
    create.add_argument("-n", type=nonnegative_int, default=0, metavar="COUNT")
    create.set_defaults(handler=create_contest)

    add = subparsers.add_parser("add", aliases=["a"], help="add solutions to the current contest")
    add.add_argument("-n", type=positive_int, required=True, metavar="COUNT")
    add.set_defaults(handler=add_solutions)

    args = parser.parse_args()
    try:
        args.handler(args)
    except (ValueError, OSError) as exc:
        print(f"cpset: error: {exc}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
