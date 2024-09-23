{ ... }:

{
  imports = [ ./common.nix ];

  home = {
    username = "aborg";
    homeDirectory = "/Users/aborg";
  };

  xdg.configFile."yabai/yabairc".source = ../yabai/yabairc;
  xdg.configFile."skhd/skhdrc".source = ../yabai/skhdrc;
}
