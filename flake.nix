{
  description = "Nix (OS & darwin) configuration files for my machines.";

  inputs = {
    nixpkgs-os.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { ... }@inputs:
  let
    helper = import ./flakeHelper.nix;
    inherit (helper) mkInstaller mkNixOS;
  in
    mkInstaller inputs.nixpkgs-os
    // mkNixOS "myrcella" inputs.nixpkgs-os "zito" [ ./modules/homelab ];
}
