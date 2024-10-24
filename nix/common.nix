{ config, pkgs, ... }:

let
  treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins
    (plugins: pkgs.tree-sitter.allGrammars));
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Many programs rely on these variables. E.g. `git commit`.
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      MANPAGER = "bat -l man -p";
    };
  };

  catppuccin.flavor = "frappe";

  # Packages to install.
  home.packages = with pkgs; [
    ripgrep
    fd
    eza
    ranger
    # Fonts that I'm using in my terminal.
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    zk
    atuin
    stylua
    nixfmt-classic
    fnlfmt
    nodePackages.typescript
    nodePackages.typescript-language-server
    # Nix language server.
    nixd
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.atuin = {
    enable = true;
    settings = {
      dialect = "uk";
      show_help = false;
    };
  };

  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.btop = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.git = {
    enable = true;
    userEmail = "git@aborg.dev";
    userName = "Andrew Borg";
    aliases = {
      lg =
        "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    extraConfig = {
      # Always push the local branch to a remote branch with the same name.
      push = { default = "current"; };
      # Use a more convenient 3-way diff algorithm.
      merge = { conflictStyle = "zdiff3"; };
      # Always pull with rebase.
      pull = { rebase = "true"; };
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };

  programs.fish = {
    enable = true;
    catppuccin.enable = true;
    loginShellInit = ''
      # Run Firefox under Wayland.
      set -x MOZ_ENABLE_WAYLAND 1
    '';
    interactiveShellInit = ''
      # Disable the greeting message.
      set -g fish_greeting

      # Enable Vim keybindings.
      fish_vi_key_bindings

      # More convenient shortcut to exit insert mode.
      bind -M insert kj 'set fish_bind_mode default; commandline -f repaint'

      # Ctrl+P and Ctrl+N to go to previous/next history command.
      bind -M insert \cp up-or-search
      bind -M insert \cn down-or-search

      # Add paths to custom-built binaries.
      fish_add_path ~/.local/bin ~/.yarn/bin ~/.cargo/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path /usr/local/texlive/2024/bin/x86_64-linux

      # Set the path of default zk notebook.
      set -gx ZK_NOTEBOOK_DIR ~/notes

      # Start pyenv lazily to speed-up shell startup.
      function pyenv
          set command $argv[1]
          set -e argv[1]

          switch "$command"
              case rehash shell
                  source (pyenv "sh-$command" $argv | psub)

              case \*
                  command pyenv "$command" $argv
          end
      end
    '';

    shellAliases = {
      t = "tmux new-session -At";
      v = "nvim";
      l = "exa -l";
      b = "bat";
      g = "git";
    };

    # These will be substituted right in the command before execution.
    shellAbbrs = {
      gst = "git status";
      gc = "git commit";
      gd = "git diff";
      ga = "git add";
      gl = "git pull";
      gs = "git switch";
      gco = "git checkout";
      hms = "home-manager switch";
      crr = "cargo run --release";
    };

    # TODO: Learn how to update versions automatically.
    plugins = [
      # Automatically starts ssh-agent within the fish shell.
      {
        name = "fish-ssh-agent";
        src = pkgs.fetchFromGitHub {
          owner = "danhper";
          repo = "fish-ssh-agent";
          rev = "fd70a2afdd03caf9bf609746bf6b993b9e83be57";
          sha256 = "1fvl23y9lylj4nz6k7yfja6v9jlsg8jffs2m5mq0ql4ja5vi5pkv";
        };
      }
      # Sources Nix environment variables on shell startup.
      {
        name = "nix-env.fish";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
          sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
        };
      }
      # Navigation to frequently used directories.
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
    ];
  };

  home.file.".zshrc".source = ../zsh/zshrc.symlink;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;

    plugins = [ treesitterWithGrammars ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/repos/dotfiles/nvim";
    recursive = true;
  };

  xdg.configFile."zed" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/repos/dotfiles/zed";
    recursive = true;
  };

  # Treesitter is configured as a locally developed module in lazy.nvim
  # we hardcode a symlink here so that we can refer to it in our lazy config
  home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
    recursive = true;
    source = treesitterWithGrammars;
  };

  xdg.configFile."stylua/stylua.toml".text = ''
    column_width = 100
    line_endings = "Unix"
    indent_type = "Spaces"
    indent_width = 2
    quote_style = "AutoPreferDouble"
    no_call_parentheses = false
  '';

  xdg.configFile."zk" = {
    source = ../zk;
    recursive = true;
  };

  xdg.configFile."helix" = {
    source = ../helix;
    recursive = true;
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    keyMode = "vi";
    historyLimit = 100000;
    # Resize window on monitor switch.
    aggressiveResize = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'frappe'
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules_right "directory session date_time"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
    ];
    extraConfig = ''
      # Upgrade terminal colors.
      set -ag terminal-overrides ",$TERM:RGB"

      # Open new window with the same path
      bind c new-window -c "#{pane_current_path}"
      bind j split-window -h -c "#{pane_current_path}"
      bind k split-window -v -c "#{pane_current_path}"

      # Renumber windows when a window is closed
      set -g renumber-windows on

      # Enable visual mode/copy shortcuts from vim
      bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
      bind-key -T copy-mode-vi 'y' send-keys -X copy-selection
    '';
  };

  programs.zoxide = { enable = true; };

  fonts.fontconfig.enable = true;

  # Enables linux-specific env variables, e.g. XDG paths.
  targets.genericLinux.enable = pkgs.stdenv.isLinux;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";
}
