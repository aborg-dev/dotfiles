# aborg's dotfiles

This repository stores my system configuration that I use across multiple machines.
The setup relies on Nix home-manager (with flakes) to install and configure the development
environment.

## Layout

- `flake.nix`: entry point; one `homeConfigurations."user@machine"` output per machine.
- `nix/common.nix`: packages, programs and shell setup shared by every machine.
- `nix/desktop.nix`: Linux desktop (Sway, Waybar, Rofi); imported by GUI machines.
- `nix/<machine>.nix`: per-machine settings (username, home directory, font size); imports the
  above.
- Other top-level directories (`nvim/`, `niri/`, `ghostty/`, ...) hold app configs that
  home-manager links into `~/.config`. `nvim/`, `niri/` and `zed/` are linked directly to this
  checkout, so edits apply immediately; the rest are copied and need a `home-manager switch`.

## Setting up a new machine

1. Install Nix and [home-manager](https://github.com/nix-community/home-manager) with flakes
   enabled. If Nix is already installed, `nix run home-manager/master -- init --switch` gets
   home-manager going.
2. Create `nix/<machine>.nix` following an existing machine (e.g. `nix/spire.nix`): import
   `./common.nix`, plus `./desktop.nix` for a Linux desktop, and set username/home directory.
3. Add a `homeConfigurations."<user>@<machine>"` entry to `flake.nix`.
4. Point home-manager at this flake:
   ```sh
   ln -s $(pwd)/flake.nix ~/.config/home-manager/flake.nix
   ```
5. Run `home-manager switch`.

## Everyday commands

```sh
home-manager switch        # build and activate the configuration
nix flake update           # update nixpkgs, home-manager, catppuccin; then switch
nix fmt                    # format Nix files
nix run home-manager/master -- switch   # recover a broken home-manager environment
```
