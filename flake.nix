{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."akashin@glados" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./nix/glados.nix
        ];
      };

      homeConfigurations."akashin@tuxedo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./nix/tuxedo.nix
        ];
      };
    };
}
