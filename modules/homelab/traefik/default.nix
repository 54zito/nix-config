{
  autoStart = true;
  image = "docker.io/traefik:v3.5.2";
  volumes = [ 
    "/run/podman/podman.sock:/var/run/docker.sock:ro"
    "/etc/localtime:/etc/localtime:ro"
  ];
  networks = [ "proxy" ];
  ports = [ 
    "80:80"
    "443:443"
    "5480:5480"
    "54443:54443"
    #"8080:8080" # api.insecure
  ];
  cmd = [
    # Dashboard
    "--api.dashboard=true"
    #"--api.insecure=true"

    # Provider
    "--providers.docker.exposedByDefault=false"

    # HOME_WEB entrypoint
    "--entrypoints.home_web.address=:80"
    #"--entrypoints.home_web.http.redirections.entryPoint.to=home_websecure"
    #"--entrypoints.home_web.http.redirections.entryPoint.scheme=https"

    # HOME_WEBSECURE entrypoint
    "--entrypoints.home_websecure.address=:443"
    #"--entrypoints.home_websecure.http.tls.certResolver=ee-f"
    #"--entrypoints.home_websecure.http.tls.domains[0].main=home.ee-f.com"
    #"--entrypoints.home_websecure.http.tls.domains[0].sans=*.home.ee-f.com"

    # WEB entrypoint
    "--entrypoints.web.address=:5480"
    #"--entrypoints.web.http.redirections.entryPoint.to=websecure"
    #"--entrypoints.web.http.redirections.entryPoint.scheme=https"

    # WEBSECURE entrypoint
    "--entrypoints.websecure.address=:54443"
    #"--entrypoints.websecure.http.tls.certResolver=ee-f"
    #"--entrypoints.websecure.http.tls.domains[0].main=ee-f.com"
    #"--entrypoints.websecure.http.tls.domains[0].sans=*.ee-f.com"

    # Certificate resolver (ee-f.com)
    #"--certificatesresolvers.ee-f.acme.email=zito@ee-f.com"
    #"--certificatesresolvers.ee-f.acme.storage=/ssl_certificates/acme.json"
    #"--certificatesresolvers.ee-f.acme.caServer=https://acme-v02.api.letsencrypt.org/directory"
    #"--certificatesresolvers.ee-f.acme.dnschallenge.provider=cloudflare"
  ];
  labels = {
    "traefik.enable" = "true";
    "traefik.http.routers.traefik.entrypoints" = "home_web";
    #"traefik.http.routers.traefik.tls.certresolver" = "ee-f";
    "traefik.http.routers.traefik.rule" = "Host(`traefik.myrcella.local`)";
    "traefik.http.routers.traefik.service" = "api@internal";
  };
}
