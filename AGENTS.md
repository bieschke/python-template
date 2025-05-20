# Contributor Guide

This project uses Python 3.13 with [uv](https://github.com/astral-sh/uv) for package management. All source code lives under `src/` and tests under `tests/`.

## Validation steps
Run these commands before committing to ensure the same checks as CI:

```bash
uv run ruff check --fix .
uv run mypy .
uv run pytest --cov=project_name --cov-report=term-missing --cov-fail-under=100
```

`ruff` handles linting and formatting, Mypy runs in strict mode, and tests must maintain 100% coverage. Optionally run `uv run pre-commit run --files <changed files>` to execute the full set of pre-commit hooks on just the modified files.

## Pull request guidelines
- Keep titles short and descriptive.
- Summarize what changed and why in the PR description.
- Ensure all checks pass before requesting review.
- Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages.
