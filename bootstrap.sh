#!/usr/bin/env bash
set -euo pipefail

# Install UV globally (fast)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Create an isolated virtual-env under .venv
uv venv        # creates .venv/ and writes activation scripts

# Install project + dev dependencies inside that env
uv pip install -e . --group dev

# Show installed package list for debugging
uv pip list

echo "✅  Environment ready – no further internet access required."
