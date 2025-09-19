{
  autoStart = true;
  dependsOn = [ "Traefik" ];
  image = "docker.io/vaultwarden/server:1.34.3-alpine";
  networks = [ "proxy" ];
  volumes = [ "/etc/localtime:/etc/localtime:ro" "/srv/share/vaultwarden-data:/data" ];
  labels = {
    "traefik.enable" = "true";
    "traefik.http.routers.vaultwarden.entrypoints" = "home_web";
    #"traefik.http.routers.vaultwarden.tls.certresolver" = "ee-f";
    "traefik.http.routers.vaultwarden.rule" = "Host(`vw.myrcella.local`)";
    "traefik.http.services.vaultwarden.loadbalancer.server.port" = "80";
  };
}
