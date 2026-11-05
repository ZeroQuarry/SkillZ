#!/usr/bin/env bash
# Symlink every skill in this repo into ~/.agents/skills, so published skills
# and local-only skills share one namespace. The repo stays the single source
# of truth: edit in either place (it's the same directory), commit, pull on
# your other machines.
#
# Idempotent. Never touches an existing real directory — a local skill with
# the same name wins, and you'll see it in the output.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_dir="${SKILLS_DIR:-$HOME/.agents/skills}"
mkdir -p "$skills_dir"

for src in "$repo_dir"/*/; do
  src="${src%/}"
  name="$(basename "$src")"
  target="$skills_dir/$name"
  if [ -L "$target" ]; then
    echo "=  $name (already linked)"
  elif [ -e "$target" ]; then
    echo "!  $name exists locally — left untouched"
  else
    ln -s "$src" "$target"
    echo "+  $name -> $src"
  fi
done
