{ config, pkgs, ... }:

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
    # Font that I'm using in my terminal.
    hack-font
    zk
  ];

  programs.git = {
    enable = true;
    userEmail = "kashin.andrej@gmail.com";
    userName = "Andrei Kashin";
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
      fish_add_path ~/.local/bin ~/.yarn/bin
    '';

    shellAliases = {
      tmx = "tmux new-session -At";
      vim = "nvim";
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
    ];
  };

  home.file.".zshrc".source = ../zsh/zshrc.symlink;
  
  # programs.neovim = {
  #   enable = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #   withPython3 = true;
  #   # Home-manager settings for Neovim always generate "init.vim", but my configuration is in
  #   # pure lua, so just load it in the generated file.
  #   extraConfig = builtins.concatStringsSep "\n" [
  #     ''
  #     luafile ${builtins.toString ../vim/nvim/main_init.lua}
  #     ''
  #   ];
  # };

  xdg.configFile."nvim/init.vim".text = ''
    luafile ${builtins.toString ../nvim/main_init.lua}
    '';

  xdg.configFile."nvim" = {
    source = ../nvim;
    recursive = true;
    # Aniseed caching breaks when used with symlinks, so we manually remove compiled
    # Fennel code on any change to vim configuration.
    onChange = "rm -rf ~/.config/nvim/lua/.compiled-lua";
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
  home.file.".tmux.conf".source = ../tmux/tmux.conf.symlink;

  fonts.fontconfig.enable = true;

  # Why do I need this?
  targets.genericLinux.enable = true;

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
