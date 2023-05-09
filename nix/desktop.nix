# Settings used for machines with desktop environment (OSX, X11, Wayland).
{ ... }:

{
  xdg.configFile."alacritty/alacritty.yml".source = ../alacritty/alacritty.yml;
  xdg.configFile."sway/config".source = ../sway/config;
  xdg.configFile."waybar" = {
    source = ../waybar;
    recursive = true;
  };
  xdg.configFile."rofi" = {
    source = ../rofi;
    recursive = true;
  };
}
