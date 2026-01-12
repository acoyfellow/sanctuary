#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

changes="$(git status --short)"

if [ -z "$changes" ]; then
  echo "guard: no changes detected"
  exit 0
fi

blocked='^.*\.(mpq|iso|exe|d2r|rom|bin)$'
if echo "$changes" | awk '{print $NF}' | grep -E "$blocked" >/dev/null 2>&1; then
  echo "guard: blocked file type detected in changes"
  exit 1
fi

max_files=25
file_count="$(printf "%s" "$changes" | awk 'END {print NR}')"
if [ "$file_count" -gt "$max_files" ]; then
  echo "guard: too many files changed ($file_count > $max_files)"
  exit 1
fi

echo "guard: changes allowed ($file_count files)"
