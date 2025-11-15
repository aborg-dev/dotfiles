# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository managed using Nix flakes and home-manager. It provides declarative configuration for multiple machines (Linux x86_64 and macOS aarch64) with consistent development environments across all systems.

## Core Architecture

### Nix Flake Structure

The repository uses a layered configuration approach:

- **flake.nix**: Entry point defining all machine configurations as `homeConfigurations` outputs
- **nix/common.nix**: Base configuration shared by all machines (packages, programs, shell setup)
- **nix/desktop.nix**: Desktop environment configs (Sway, Waybar, Alacritty, Rofi) for Linux GUI machines
- **nix/osx.nix**: macOS-specific configs (Yabai, SKHD, SketchyBar)
- **nix/{machine}.nix**: Individual machine configs that import common.nix and optionally desktop.nix/osx.nix

Each machine configuration imports the Catppuccin Nix module for consistent theming.

### Configuration Deployment

Most application configs live in their own directories (e.g., `lazyvim/`, `zed/`, `ghostty/`) and are symlinked via `xdg.configFile` in nix/common.nix. The symlinks point to the actual repository location using `config.lib.file.mkOutOfStoreSymlink` so configs can be edited in place without rebuilding.

## Commands

### Update Configuration

After editing any Nix files or application configs:

```bash
home-manager switch
```

This rebuilds and activates the new configuration.

### Update Dependencies

To update all flake inputs (nixpkgs, home-manager, catppuccin):

```bash
nix flake update
```

Then apply with `home-manager switch`.

### Format Nix Files

```bash
nix fmt
```

This will format all Nix files in the repository using `nixfmt-tree`.

### Restore Broken Environment

If home-manager environment becomes corrupted:

```bash
nix run home-manager/master -- switch
```

## Adding a New Machine

1. Create `nix/{machine-name}.nix` following the pattern of existing machines (import common.nix, set username/homeDirectory)
2. For desktop Linux machines, also import `./desktop.nix`
3. For macOS machines, import only `./common.nix` (see osx.nix)
4. Add machine-specific settings like display resolution (see spire.nix for 1440p font example)
5. Add new `homeConfigurations."{user}@{machine}"` entry in flake.nix outputs
6. Link flake.nix to home-manager config: `ln -s $(pwd)/flake.nix ~/.config/home-manager/flake.nix`
7. Run `home-manager switch` to build and activate

## Key Configuration Details

### Editor Setup

- Default editor: Helix (`hx`) set via EDITOR/VISUAL environment variables
- Helix config includes custom keybindings: `kj` to exit insert mode, `<space><space>` for file picker
- Neovim (LazyVim) available as alternative with `v` alias
- Zed editor supported with separate config directory

### Shell Configuration

- Primary shell: Fish with vi keybindings (`fish_vi_key_bindings`)
- Key features: Atuin for history (Ctrl+R), z for directory jumping, ssh-agent plugin
- Custom keybinding: `kj` in insert mode exits to normal mode
- Shell abbreviations defined in nix/common.nix shellAbbrs (e.g., `hms` → `home-manager switch`)

### Git/Jujutsu Setup

- Git commits are signed with SSH key (~/.ssh/id_ed25519.pub)
- Always pull with rebase, push to current branch
- Uses zdiff3 merge conflict style
- Jujutsu (jj) configured as alternative VCS with custom `tug` alias

### Desktop Environment

Linux machines use:
- **Sway**: Wayland compositor (config in sway/config)
- **Waybar**: Status bar
- **Niri**: Alternative compositor (config in niri/config.kdl)
- **Ghostty/Alacritty**: Terminal emulators

macOS machines use:
- **Yabai**: Tiling window manager
- **SKHD**: Hotkey daemon
- **SketchyBar**: Status bar

### Theming

All programs use Catppuccin Frappe theme via the catppuccin.nix module. Theme is automatically applied to Fish, Bat, Yazi, Starship, Btop, and Tmux through the catppuccin config block in common.nix.

## Important Notes

- Machine-specific font sizes handled via separate font.toml files (1080p_font.toml, 1440p_font.toml)
- Custom PATH additions in Fish config: ~/.local/bin, ~/.yarn/bin, ~/.cargo/bin, /opt/homebrew/bin
- Tmux prefix is Ctrl+A (not default Ctrl+B)
- Helix and Stylua formatters configured to use 100-character line width
- ZK notebook directory defaults to ~/notes (set via ZK_NOTEBOOK_DIR)
