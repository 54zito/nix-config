{
  description = "Nix (OS & darwin) configuration files for my machines.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-darwin-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager-darwin = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    nixvim-darwin = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    secrets = {
      url = "git+ssh://git@github.com/54zito/nix-config-secrets.git";
      flake = false;
    };
  };

  outputs = { ... }@inputs:
  {
    darwinConfigurations."arya" = inputs.nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./machines/darwin
        ./machines/darwin/arya
        inputs.home-manager-darwin.darwinModules.default
        ./modules
        ./users/zito
      ];
    };
  };
}