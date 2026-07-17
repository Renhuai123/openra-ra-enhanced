#!/usr/bin/env bash
# Remove the ra-enhanced symlink/junction from OpenRA user mods dirs.
set -euo pipefail

targets=(
  "$HOME/Library/Application Support/OpenRA/mods/ra-enhanced"
  "$HOME/.config/openra/mods/ra-enhanced"
  "$HOME/.openra/mods/ra-enhanced"
  "$HOME/.config/OpenRA/mods/ra-enhanced"
)

if [[ -n "${APPDATA:-}" ]]; then
  targets+=("$APPDATA/OpenRA/mods/ra-enhanced")
fi

removed=0
for t in "${targets[@]}"; do
  if [[ -e "$t" || -L "$t" ]]; then
    rm -rf "$t"
    echo "Removed $t"
    removed=1
  fi
done

if [[ "$removed" -eq 0 ]]; then
  echo "No installed ra-enhanced mod found in known locations."
fi
