{
  mkIso = nixpkgsVersion: sshKeys: {
    nixosConfigurations.installer = nixpkgsVersion.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ pkgs, modulesPath, ... }: {
          imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
          services.openssh.enable = true;
          systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
          users.users.root.openssh.authorizedKeys.keys = sshKeys;
          environment.systemPackages = with pkgs; [ disko pciutils htop neofetch ];
        })
      ];
    };
  };
}
