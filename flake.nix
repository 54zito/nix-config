{
  description = "Nix (OS & darwin) configuration files for my machines.";

  inputs = {
    nixpkgs-os.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { ... }@inputs: {
    nixosConfigurations = {
      exampleIso = inputs.nixpkgs-os.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({ pkgs, modulesPath, ... }: {
            imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
            systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
            users.users.root.openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA username@host"
            ];
            environment.systemPackages = with pkgs; [ pciutils htop ];
          })
        ];
      };
    };
  };
}
