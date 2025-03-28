# aborg's dotfiles

This repository stores my system configuration that I use across multiple machines.
The setup relies Nix home-manager to install and configure the development environment.

## Usage

First, follow the installation guide for [Nix home-manager](https://github.com/nix-community/home-manager).
This config uses Nix flakes, so they will need to be enabled.

If you have Nix installed, you can usually get started with home-manager by running
```sh
nix run home-manager/master -- init --switch
```

To start using the configuration from this repository, you need to put `flake.nix` into home-manager config folder:
```sh
ln -s $(pwd)/flake.nix ~/.config/home-manager/flake.nix
```

Then, machine configuration needs to be added into "nix" folder by following the example from other
machines (e.g. "nix/spire.nix").
Finally, add the machine to the list of `outputs` in flake.nix.

The environment can now be installed and updated with `home-manager switch`.

If you mess the home-manager environment, it can be restored with
```sh
nix run home-manager/master -- switch
```
