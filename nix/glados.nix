{ ... }:

{
  imports = [ ./common.nix ./desktop.nix ];

  home = {
    username = "akashin";
    homeDirectory = "/home/akashin";
  };

  xdg.configFile."alacritty/font.yml".source = ../alacritty/1440p_font.yml;
}
