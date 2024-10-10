{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Catppuccin theme has a nix module that allows to enable it for a range of programs.
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

    homeConfigurations."aborg@glados" =
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./nix/glados.nix catppuccin.homeManagerModules.catppuccin ];
      };

    homeConfigurations."aborg@spire" =
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./nix/spire.nix catppuccin.homeManagerModules.catppuccin ];
      };

    homeConfigurations."aborg@tuxedo" =
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./nix/tuxedo.nix catppuccin.homeManagerModules.catppuccin ];
      };

    homeConfigurations."aborg@hermes" =
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [ ./nix/osx.nix catppuccin.homeManagerModules.catppuccin ];
      };

    homeConfigurations."aborg@odroid" =
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./nix/odroid.nix catppuccin.homeManagerModules.catppuccin ];
      };

    homeConfigurations."aborg" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      modules = [ ./nix/osx.nix catppuccin.homeManagerModules.catppuccin ];
    };
  };
}
