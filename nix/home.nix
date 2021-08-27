{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "akashin";
  home.homeDirectory = "/home/akashin";

  # Packages to install.
  home.packages = with pkgs; [
    tmux
    fzf
    ripgrep
    fd
    # Font that I'm using in my terminal.
    hack-font
  ];

  programs.git = {
    enable = true;
    userEmail = "kashin.andrej@gmail.com";
    userName = "Andrei Kashin";
  };

  programs.zsh = {
    enable = true;
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
    '';

    shellAliases = {
      vim = "nvim";
      tmx = "tmux new-session -At";
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
  };

  programs.emacs = {
    enable = true;
  };

  home.file.".zshrc".source = ../zsh/zshrc.symlink;

  xdg.configFile."alacritty/alacritty.yml".source = ../alacritty/alacritty.yml.symlink;
  xdg.configFile."sway/config".source = ../sway/config;
  xdg.configFile."waybar" = {
    source = ../waybar;
    recursive = true;
  };

  xdg.configFile."nvim" = {
    source = ../vim/nvim;
    recursive = true;
    # Aniseed caching breaks when used with symlinks, so we manually remove compiled
    # Fennel code on any change to vim configuration.
    onChange = "rm -r ~/.config/nvim/lua/.compiled-lua";
  };

  # Emacs configs.
  home.file.".doom.d/packages.el".source = ../emacs/doom/packages.el.symlink;
  home.file.".doom.d/config.el".source = ../emacs/doom/config.el.symlink;
  home.file.".doom.d/init.el".source = ../emacs/doom/init.el.symlink;

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
  home.stateVersion = "21.11";
}
