# Project Name

This is a template Python project using UV for package management and Ruff for
linting and formatting. All code lives in `src/` and is tested with pytest to
100% coverage.

## Development

1. Install [uv](https://github.com/astral-sh/uv).
2. Create a virtual environment and install dependencies:

```bash
uv venv
uv pip install -e ".[dev]"
```

3. Run the tests:

```bash
uv run pytest
```
