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

  xdg.configFile."sway/font".source = ../sway/1440p_font;
}
