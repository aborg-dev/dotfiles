# Settings used for machines with desktop environment (OSX, X11, Wayland).
{ ... }:

{
  xdg.configFile."alacritty/alacritty.yml".source = ../alacritty/alacritty.yml.symlink;
  xdg.configFile."sway/config".source = ../sway/config;
  xdg.configFile."waybar" = {
    source = ../waybar;
    recursive = true;
  };
  xdg.configFile."rofi" = {
    source = ../rofi;
    recursive = true;
  };

  programs.emacs = {
    enable = true;
  };

  # Emacs configs.
  home.file.".doom.d/packages.el".source = ../emacs/doom/packages.el.symlink;
  home.file.".doom.d/config.el".source = ../emacs/doom/config.el.symlink;
  home.file.".doom.d/init.el".source = ../emacs/doom/init.el.symlink;
}
