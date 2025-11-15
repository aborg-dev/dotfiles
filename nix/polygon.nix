{ ... }:

{
  imports = [
    ./common.nix
    ./desktop.nix
  ];

  home = {
    username = "polygon";
    homeDirectory = "/home/polygon";
  };

  xdg.configFile."alacritty/font.toml".source = ../alacritty/1440p_font.toml;
  xdg.configFile."sway/font".source = ../sway/1440p_font;
}
