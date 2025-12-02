#!/usr/bin/env bash
set -ex

root=$(dirname $0)

echo "Root $root"

/root/.local/bin/uv run $root/monitor.py

