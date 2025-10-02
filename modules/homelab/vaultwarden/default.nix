{
  autoStart = true;
  image = "docker.io/vaultwarden/server:1.34.0-alpine";
  volumes = [
    "/z-homelab/vaultwarden:/data"
  ];
  networks = [ "proxy" ];
  labels = {
    "traefik.enable" = "true";
    "traefik.http.routers.vaultwarden.entrypoints" = "homeWebSecure";
    "traefik.http.routers.vaultwarden.tls.certresolver" = "ee-f";
    "traefik.http.routers.vaultwarden.rule" = "Host(`vaultwarden.home.ee-f.com`)";
    "traefik.http.services.vaultwarden.loadbalancer.server.port" = "80";
  };
}
