{ lib, config, ... }:

{
  options = {
    ZConfig.homelab.enable = lib.mkOption {
      description = "Enables the HomeLab module.";
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.ZConfig.homelab.enable {
    systemd.services.podman-CreateHomeNetwork = import ./utils/home_network.nix;     
    systemd.services.podman-CreateProxyNetwork = import ./utils/proxy_network.nix;     
    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
      oci-containers = {
        backend = "podman";
        containers = {
          AdGuardHome = import ./adguardhome;
          Traefik = import ./traefik;
          VaultWarden = import ./vaultwarden;
        };
      };
    };
  };
}
