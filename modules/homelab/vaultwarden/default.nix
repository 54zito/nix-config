{
  autoStart = true;
  image = "docker.io/vaultwarden/server:1.34.0-alpine";
  volumes = [
    "/etc/localtime:/etc/localtime:ro"
    "/persistant/services/vaultwarden:/data"
  ];
  networks = [ "proxy" ];
  labels = {
    "traefik.enable" = "true";
    "traefik.http.routers.vaultwarden.entrypoints" = "web_secure";
    "traefik.http.routers.vaultwarden.tls.certresolver" = "ee-f";
    "traefik.http.routers.vaultwarden.rule" = "Host(`vw.ee-f.com`)";
    "traefik.http.services.vaultwarden.loadbalancer.server.port" = "80";
  };
}
