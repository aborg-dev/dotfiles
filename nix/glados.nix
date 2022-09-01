{ ... }:

{
  imports = [ ./common.nix ./desktop.nix ];

  home = {
    username = "akashin";
    homeDirectory = "/home/akashin";
  };
}
