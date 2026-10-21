# CLAUDE.md

Personal Nix home-manager dotfiles. Repo layout and everyday commands are in README.md; read the
code for what each program is configured to do.

## Workflow

- Edit files in this repo, never the generated copies under `~/.config`.
- After changing Nix files: `nix fmt`
- `nvim/`, `niri/` and `zed/` are symlinked live and need no switch; other app config
  directories are copied into the Nix store and do.

## Validating changes

- niri: `niri validate -c niri/config.kdl`.
- tmux: test on a separate server (`tmux -L test -f ~/.config/tmux/tmux.conf ...`), never the
  user's running session.
