#!/usr/bin/env bash
# Install (symlink) ra-enhanced into the OpenRA user mods directory.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/mod/ra-enhanced"

if [[ ! -f "$SRC/mod.yaml" ]]; then
  echo "error: missing $SRC/mod.yaml" >&2
  exit 1
fi

candidates=()
case "$(uname -s)" in
  Darwin)
    candidates+=("$HOME/Library/Application Support/OpenRA/mods")
    ;;
  Linux)
    candidates+=(
      "$HOME/.config/openra/mods"
      "$HOME/.openra/mods"
      "$HOME/.config/OpenRA/mods"
    )
    ;;
  MINGW*|MSYS*|CYGWIN*|Windows_NT)
    if [[ -n "${APPDATA:-}" ]]; then
      candidates+=("$APPDATA/OpenRA/mods")
    fi
    ;;
esac

# Always try common fallbacks
candidates+=(
  "$HOME/Library/Application Support/OpenRA/mods"
  "$HOME/.config/openra/mods"
  "$HOME/.openra/mods"
)

DEST_DIR=""
for d in "${candidates[@]}"; do
  parent="$(dirname "$d")"
  if [[ -d "$parent" ]] || [[ "$(uname -s)" == "Darwin" && "$d" == *"Application Support/OpenRA"* ]]; then
    DEST_DIR="$d"
    break
  fi
done

if [[ -z "$DEST_DIR" ]]; then
  DEST_DIR="${candidates[0]}"
fi

mkdir -p "$DEST_DIR"
TARGET="$DEST_DIR/ra-enhanced"

if [[ -e "$TARGET" || -L "$TARGET" ]]; then
  echo "Removing existing: $TARGET"
  rm -rf "$TARGET"
fi

ln -sfn "$SRC" "$TARGET"
echo "Installed mod symlink:"
echo "  $TARGET -> $SRC"
echo
echo "Next:"
echo "  1) Install OpenRA and import Red Alert content via the official installer."
echo "  2) Start with Game.Mod=ra-enhanced (see README.md)."
echo "  3) This repo does NOT ship game binaries or .mix assets."
