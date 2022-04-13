{ ... }:

{
  imports = [ ./common.nix ./desktop.nix ];

  home = {
    username = "acid";
    homeDirectory = "/home/acid";
  };
}
