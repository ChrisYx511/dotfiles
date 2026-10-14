# Dotfiles

Personal macOS configuration managed with GNU Stow. Each top-level package
mirrors paths relative to your home directory.

| Package | Target |
| --- | --- |
| codex | `~/.codex/AGENTS.md`, `~/.codex/skills` (excluding `.system`) |
| nvim | `~/.config/nvim` |
| zsh | `~/.zshrc` |
| skhd | `~/.config/skhd` |
| yabai | `~/.config/yabai` |
| applescripts | `~/AppleScripts` |

## Setup

Install Git and GNU Stow (`brew install git stow` if missing), then clone this
repository to `~/dotfiles`. The application configurations require their
respective applications; they are not installed by Stow.

From the repository directory, preview and then create the links:

```sh
stow --simulate --verbose --target="$HOME" codex nvim zsh skhd yabai applescripts
stow --verbose --target="$HOME" codex nvim zsh skhd yabai applescripts
```

Use package names individually to install only the configuration you need.
Back up and move any existing conflicting files before stowing. Avoid `--adopt`,
which can overwrite repository files with the existing target contents.

Edit files in the repository or through their home-directory links. After adding
files, rerun Stow. Remove links with:

```sh
stow --delete --target="$HOME" codex nvim zsh skhd yabai applescripts
```

Codex-managed `.system` skills stay outside this repository. Neovim's plugin
lockfile is included; generated caches and nested Git metadata are excluded.
AppleScript `.scpt` files are preserved in their original compiled format.
Review configuration for private values and machine-specific paths before
publishing. This repository does not manage credentials or application state.
