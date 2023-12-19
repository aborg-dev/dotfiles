{ config, pkgs, ... }:

let
  treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars));
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Many programs rely on these variables. E.g. `git commit`.
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    };
  };

  # Packages to install.
  home.packages = with pkgs; [
    tmux
    fzf
    ripgrep
    fd
    bat
    ranger
    # Fonts that I'm using in my terminal.
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    zk
  ];

  programs.git = {
    enable = true;
    userEmail = "kashin.andrej@gmail.com";
    userName = "Andrei Kashin";
    aliases = {
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
  };

  programs.fish = {
    enable = true;
    loginShellInit = ''
      # Run Firefox under Wayland.
      set -x MOZ_ENABLE_WAYLAND 1
    '';
    interactiveShellInit = ''
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
      theme_gruvbox dark
    '';

    shellAliases = {
      tmx = "tmux new-session -At";
      vim = "nvim";
      hx = "helix";
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
      # The colorscheme that I use.
      {
        name = "gruvbox";
        src = pkgs.fetchFromGitHub {
          owner = "jomik";
          repo = "fish-gruvbox";
          rev = "d8c0463518fb95bed8818a1e7fe5da20cffe6fbd";
          sha256 = "0hkps4ddz99r7m52lwyzidbalrwvi7h2afpawh9yv6a226pjmck7";
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

    plugins = [
      treesitterWithGrammars
    ];
  };

  xdg.configFile."nvim" = {
    source = ../nvim;
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
    no_call_parentheses = true
  '';

  # Tmux config.
  home.file.".tmux.conf".source = ../tmux/tmux.conf;

  xdg.configFile."zk" = {
    source = ../zk;
    recursive = true;
  };

  xdg.configFile."helix" = {
    source = ../helix;
    recursive = true;
  };

  programs.zoxide = {
    enable = true;
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
