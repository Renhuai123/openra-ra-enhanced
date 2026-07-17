# Mod package: `ra-enhanced`

OpenRA mod id: **ra-enhanced**

## Layout

| Path | Role |
|------|------|
| `mod.yaml` | Manifest (overlay on stock `ra`, based on OpenRA `release-20250330`) |
| `rules/` | AI / QoL MiniYaml overlays |
| `chrome/` | UI chrome overrides |
| `fluent/` | Localization strings |
| `bits/`, `uibits/` | Optional mod-owned assets (no copyrighted RA packs) |
| `maps/` | Optional custom maps |

## Indentation

OpenRA MiniYaml **requires tabs**. Configure your editor accordingly.

## Content policy

Do not place Red Alert `.mix` files or game binaries here. Players import content through OpenRA.

## Syncing with upstream

When OpenRA releases a new version, diff `mods/ra/mod.yaml` and update this manifest. Keep our overlay lines at the end of `Rules:` / `Chrome:` / `FluentMessages:`.
