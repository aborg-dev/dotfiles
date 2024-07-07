# Settings used for machines with desktop environment (OSX, X11, Wayland).
{ ... }:

{
  xdg.configFile."alacritty/alacritty.toml".source = ../alacritty/alacritty.toml;
  xdg.configFile."alacritty/themes" = {
    source = ../alacritty/themes;
    recursive = true;
  };

  xdg.configFile."sway/config".source = ../sway/config;
  xdg.configFile."sway/themes" = {
    source = ../sway/themes;
    recursive = true;
  };
  xdg.configFile."waybar" = {
    source = ../waybar;
    recursive = true;
  };
  xdg.configFile."rofi" = {
    source = ../rofi;
    recursive = true;
  };
}
