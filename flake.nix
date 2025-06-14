{
  description = "Nix (OS & darwin) configuration files for my machines.";

  inputs = {
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nixpkgs-darwin-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager-darwin = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    z-env = {
      url = "git+ssh://git@github.com/54zito/z-env.git";
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