#!/usr/bin/env bash
# Install (symlink) ra-enhanced into OpenRA mod search paths.
# Packaged macOS apps only scan EngineDir/mods by default (not SupportDir/mods).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/mod/ra-enhanced"

if [[ ! -f "$SRC/mod.yaml" ]]; then
  echo "error: missing $SRC/mod.yaml" >&2
  exit 1
fi

install_link() {
  local dest_dir="$1"
  mkdir -p "$dest_dir"
  local target="$dest_dir/ra-enhanced"
  if [[ -e "$target" || -L "$target" ]]; then
    echo "Removing existing: $target"
    rm -rf "$target"
  fi
  ln -sfn "$SRC" "$target"
  echo "Installed mod symlink:"
  echo "  $target -> $SRC"
}

case "$(uname -s)" in
  Darwin)
    # User support dir (docs / some tools); packaged apps often ignore this for loading.
    install_link "$HOME/Library/Application Support/OpenRA/mods"

    # Packaged OpenRA - Red Alert.app (release DMG / Homebrew cask layout)
    RA_APP_MODS="/Applications/OpenRA - Red Alert.app/Contents/Resources/mods"
    if [[ -d "$RA_APP_MODS" ]]; then
      install_link "$RA_APP_MODS"
    else
      echo "note: $RA_APP_MODS not found — install OpenRA first, then re-run."
    fi
    ;;
  Linux)
    for d in "$HOME/.config/openra/mods" "$HOME/.openra/mods" "$HOME/.config/OpenRA/mods"; do
      parent="$(dirname "$d")"
      if [[ -d "$parent" ]]; then
        install_link "$d"
        break
      fi
    done
    if [[ ! -e "$HOME/.config/openra/mods/ra-enhanced" && ! -e "$HOME/.openra/mods/ra-enhanced" ]]; then
      install_link "$HOME/.config/openra/mods"
    fi
    ;;
  MINGW*|MSYS*|CYGWIN*|Windows_NT)
    if [[ -n "${APPDATA:-}" ]]; then
      install_link "$APPDATA/OpenRA/mods"
    fi
    ;;
  *)
    install_link "$HOME/Library/Application Support/OpenRA/mods"
    ;;
esac

echo
echo "Launch (macOS packaged app):"
echo "  /Applications/OpenRA\ -\ Red\ Alert.app/Contents/MacOS/Launcher Game.Mod=ra-enhanced"
echo "  # or: Game.Mod=\"$SRC\""
echo
echo "Next:"
echo "  1) Import Red Alert content via OpenRA Content Installer (required)."
echo "  2) In skirmish, pick Enhanced Normal / Enhanced Hard bots."
echo "  3) This repo does NOT ship game binaries or .mix assets."
