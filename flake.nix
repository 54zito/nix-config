{
  description = "Nix (OS & darwin) configuration files for my machines.";

  inputs = {
    nixpkgs-os.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { ... }@inputs:
  let
    helper = import ./flakeHelper.nix;
    inherit (helper) mkIso;
  in
    mkIso inputs.nixpkgs-os [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOdql6mn2PV9t6hKcalKQ8v8f+5G0yLfVsgpC9hAH/fg zito@arya"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDWPROBi9Zpi2SrTm8b+i0XalEK+f4fNKyhU9nGGWOTL zito@myrcella"
    ] // { packages.x86_64-linux.installer = inputs.self.nixosConfigurations.installer.config.system.build.isoImage; };
}
