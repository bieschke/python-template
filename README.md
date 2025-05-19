# Project Name

This is a template Python project using UV for package management and Ruff for
linting and formatting. All code lives in `src/` and is tested with pytest to
100% coverage.

## Development

1. Install [uv](https://github.com/astral-sh/uv) or run `./bootstrap.sh` which
   performs all setup steps automatically.
2. If running manually, create a virtual environment and install dependencies:

   ```bash
   uv venv
   # Install project and dev dependencies from the `dev` group
   uv pip install -e . --group dev
   ```

3. Run the tests:

   ```bash
   uv run pytest
   ```

## Dependency management

All project and development dependencies are pinned in `pyproject.toml` to
ensure the versions installed in CI match what gets deployed. Update these pins
whenever you want to upgrade packages.

## Linting and type checking

Use [Ruff](https://github.com/astral-sh/ruff) for linting/formatting and
[Mypy](https://mypy-lang.org/) for static type checking:

```bash
uv run ruff check --fix .
uv run mypy .
```

## Pre-commit hooks

A `.pre-commit-config.yaml` is included. Install the hooks so they run
automatically on each commit:

```bash
pre-commit install
pre-commit run --all-files  # optional, run on entire repo
```

## Releasing

Update the version in `pyproject.toml`, then build and upload the distribution:

```bash
uv run python -m build
uv run twine upload dist/*
```
