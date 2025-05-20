#!/usr/bin/env bash
set -euo pipefail

# -------- 1. Install UV globally (fast) --------
python -m pip install --upgrade --no-cache-dir "uv==0.7.5"

# -------- 2. Create an isolated virtual-env under .venv --------
uv venv        # creates .venv/ and writes activation scripts

# -------- 3. Install project + dev dependencies inside that env --------
uv pip install -e . --group dev

# -------- 4. (Optional) pre-warm: lint, type-check, test, byte-compile ----
# uv run ruff check --fix .
# uv run mypy .
# uv run pytest
# uv run python -m compileall -q "$(python - <<'PY' -c 'import site, json, sys; print(site.getsitepackages()[0])' PY)"

# -------- 5. Show installed package list for debugging (not required) ----
uv pip list

echo "✅  Environment ready – no further internet access required."
