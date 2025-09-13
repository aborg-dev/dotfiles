{ config, pkgs, ... }:

{
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

  catppuccin = {
    flavor = "frappe";
    bat.enable = true;
    fish.enable = true;
    yazi.enable = true;
    starship.enable = true;
    btop.enable = true;
  };

  # Packages to install.
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    eza
    ranger
    # Fonts that I'm using in my terminal.
    jetbrains-mono
    nerd-fonts.jetbrains-mono
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
  };

  programs.btop = {
    enable = true;
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
    loginShellInit = ''
      # Run Firefox under Wayland.
      set -x MOZ_ENABLE_WAYLAND 1
    '';
    interactiveShellInit = ''
      # Disable the greeting message.
      set -g fish_greeting

      # Enable Vim keybindings.
      fish_vi_key_bindings

      # Add paths to custom-built binaries.
      fish_add_path ~/.local/bin ~/.yarn/bin ~/.cargo/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path /usr/local/texlive/2024/bin/x86_64-linux

      set -gx ATUIN_NOBIND "true"
      atuin init fish | source

      # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
      bind \cr _atuin_search
      bind -M insert \cr _atuin_search

      # More convenient shortcut to exit insert mode.
      bind -M insert kj 'set fish_bind_mode default; commandline -f repaint'

      # Ctrl+P and Ctrl+N to go to previous/next history command.
      # Ideally, I would use J and K here, but this conflicts with Tmux-navigator.
      bind -M insert \cp up-or-search
      bind -M insert \cn down-or-search

      # Set the path of default zk notebook.
      set -gx ZK_NOTEBOOK_DIR ~/notes

      # Zed editor
      if test "$TERM_PROGRAM" = "zed"
          set -x EDITOR zeditor --wait
          set -x VISUAL zeditor --wait
      end
    '';

    shellAliases = {
      t = "tmux new-session -At";
      v = "nvim";
      l = "exa -l";
      b = "bat";
      g = "git";
      j = "jj";
      e = "zeditor";
    };

    # These will be substituted right in the command before execution.
    shellAbbrs = {
      gst = "git status";
      gc = "git commit";
      gd = "git diff";
      ga = "git add";
      gl = "git pull";
      gco = "git checkout";
      hms = "home-manager switch";
      crr = "cargo run --release";
      jc = "jj commit";
      jd = "jj diff";
      jf = "jj git fetch";
      jp = "jj bookmark set master -r @- && jj git push";
      jr = "jj rebase -d";
      sps = "sudo pacman -S";
      spu = "sudo pacman -Syu";
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
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/repos/dotfiles/lazyvim";
    recursive = true;
  };

  xdg.configFile."zed" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/repos/dotfiles/zed";
    recursive = true;
  };

  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/repos/dotfiles/niri";
    recursive = true;
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

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_frappe";
      editor = {
        rulers = [100];
        cursorline = true;
        true-color = true;
      };
      keys.insert = {
        k = { j = "normal_mode"; };
      };
      keys.normal = {
        "C-s" = [":write"];
        "C-q" = [":quit"];
        space = { 
          space = "file_picker_in_current_directory";
          "," = "buffer_picker";
        };
        ret = "goto_word";
      };
    };
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "html";
          language-servers = [ "vscode-html-language-server" "tailwindcss-ls" ];
        }
        {
          name = "css"; 
          language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
        }
        {
          name = "jsx";
          language-servers = [ "typescript-language-server" "tailwindcss-ls" ];
        }
        {
          name = "tsx";
          language-servers = [ "typescript-language-server" "tailwindcss-ls" ];
        }
        {
          name = "svelte";
          language-servers = [ "svelteserver" "tailwindcss-ls" ];
        }
      ];
      language-server = {
        tailwindcss-ls = {
          command = "tailwindcss-language-server";
          args = ["--stdio"];
        };
      };
    };
  };

  xdg.configFile."ghostty" = {
    source = ../ghostty;
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
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_status_justify "absolute-centre"

          set -g @catppuccin_status_modules_right "session"
        '';
      }
    ];
    extraConfig = ''
      # Upgrade terminal colors.
      set -ag terminal-overrides ",$TERM:RGB"

      # Disable delay between sending an Escape key.
      set -sg escape-time 0

      # Open new window with the same path.
      bind c new-window -c "#{pane_current_path}"
      bind j split-window -h -c "#{pane_current_path}"
      bind k split-window -v -c "#{pane_current_path}"

      # Avoid conflict with window navigation.
      bind e detach

      # Move the status bar to the top.
      set -g status-position top

      # Fast window navigation on the split-keyboard.
      bind a select-window -t:1
      bind s select-window -t:2
      bind d select-window -t:3
      bind f select-window -t:4
      bind g select-window -t:5

      # Start windows and panes at 1, not 0.
      set -g base-index 1
      setw -g pane-base-index 1

      # Renumber windows when a window is closed.
      set -g renumber-windows on

      # Enable visual mode/copy shortcuts from vim.
      bind \; copy-mode
      bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
      bind-key -T copy-mode-vi 'y' send-keys -X copy-selection
    '';
  };

  programs.zoxide = { enable = true; };

  programs.yazi = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$character";
      character = {
        success_symbol = "[](green)";
        error_symbol = "[](red)";
        vimcmd_symbol = "[](purple)";
      };
    };
  };

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
