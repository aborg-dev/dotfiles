{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "akashin";
  home.homeDirectory = "/home/akashin";

  # Packages to install.
  home.packages = [
    pkgs.tmux
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
  ];

  programs.git = {
    enable = true;
    userEmail = "kashin.andrej@gmail.com";
    userName = "Andrei Kashin";
  };

  programs.zsh = {
    enable = true;
  };

  programs.emacs = {
    enable = true;
  };

  home.file.".zshrc".source = ../zsh/zshrc.symlink;

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
