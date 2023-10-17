{
  description = "Home Manager Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    flake-utils,
    home-manager,
    nixpkgs,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      formatter = pkgs.alejandra;

      legacyPackages.homeConfigurations = {
        dev = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [./hosts/dev-box.nix];
        };
        home = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [./hosts/home-desktop.nix];
        };
        work = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [./hosts/work-laptop.nix];
        };
      };
    });
}
