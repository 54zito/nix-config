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
    systemd.services.podmanCreateHomeNetwork = import ./home_network.nix;     
    systemd.services.podmanCreateProxyNetwork = import ./proxy_network.nix;     
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
          HomeAssistant = import ./homeassistant;
          AdGuardHome = import ./adguardhome;
          Traefik = import ./traefik;
          Vaultwarden = import ./vaultwarden;
        };
      };
    };
  };
}
