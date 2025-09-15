{
  # INSTALLER
  mkInstaller = nixpkgsVersion:
    let
      installer = nixpkgsVersion.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./machines/installer ];
      };
    in
    {
      nixosConfigurations.installer = installer;
      packages.x86_64-linux.installer = installer.config.system.build.isoImage;
    };
  # NIXOS
  mkNixOS = hostName: nixpkgsVersion: userName: {
    nixosConfigurations.${hostName} = nixpkgsVersion.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./machines/nixos
        ./machines/nixos/${hostName}
        ./users/${userName}
      ];
    };
  };
}
