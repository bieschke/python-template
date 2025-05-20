#!/usr/bin/env bash
set -euo pipefail

UV_VERSION="0.7.6"

# 1 ‧ install uv
curl -LsSf "https://astral.sh/uv/${UV_VERSION}/install.sh" | sh

# 2 ‧ install EXACT deps from uv.lock, fail if stale
uv sync --locked

# 3 ‧ debug output
uv pip list

echo "✅ Environment ready – no further internet access required."
