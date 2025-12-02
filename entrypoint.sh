#!/usr/bin/env bash
set -ex

root=$(dirname $0)

echo "Root $root"

uv run $root/monitor.py

