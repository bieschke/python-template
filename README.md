# Project Name

This is a template Python project using UV for package management and Ruff for
linting and formatting. All code lives in `src/` and is tested with pytest to
100% coverage.

## Development

1. Install [uv](https://github.com/astral-sh/uv) or run `./bootstrap.sh` which
   performs all setup steps automatically.
2. If running manually, install dependencies from `uv.lock` for a fully
   reproducible environment:

   ```bash
   uv sync --locked
   ```

3. Run the tests:

```bash
uv run pytest --cov=project_name --cov-report=term-missing --cov-fail-under=100
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

These hooks handle formatting and lightweight checks only. Run Mypy and the
tests yourself before committing to match the CI pipeline:

```bash
uv run mypy .
uv run pytest --cov=project_name --cov-report=term-missing --cov-fail-under=100
```
CI will execute the same commands.

## Releasing

Update the version in `pyproject.toml`, then build and upload the distribution:

```bash
uv run python -m build
uv run twine upload dist/*
```
