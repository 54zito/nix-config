{
  autoStart = true;
  image = "docker.io/traefik:v3.5.2";
  volumes = [ 
    "/run/podman/podman.sock:/var/run/docker.sock:ro"
    "/z-homelab/traefik/keys:/api_keys:ro"
    "/z-homelab/traefik/ssl_certificates:/ssl_certificates"
  ];
  networks = [ "proxy" ];
  ports = [ 
    "80:80"
    "443:443"
    "5480:5480"
    "54443:54443"
  ];
  environment = {
    CLOUDFLARE_DNS_API_TOKEN_FILE = "/api_keys/dns.key";
    CLOUDFLARE_ZONE_API_TOKEN_FILE = "/api_keyszone.key";
  };
  cmd = [
    # Dashboard
    "--api.dashboard=true"
    # Provider
    "--providers.docker.exposedByDefault=false"
    # HOME entrypoint
    "--entrypoints.homeWeb.address=:80"
    "--entrypoints.homeWeb.http.redirections.entryPoint.to=homeWebSecure"
    "--entrypoints.homeWeb.http.redirections.entryPoint.scheme=https"
    # HOME_SECURE entrypoint
    "--entrypoints.homeWebSecure.address=:443"
    "--entrypoints.homeWebSecure.http.tls.certResolver=ee-f"
    "--entrypoints.homeWebSecure.http.tls.domains[0].main=home.ee-f.com"
    "--entrypoints.homeWebSecure.http.tls.domains[0].sans=*.home.ee-f.com"
    # WEB entrypoint
    #"--entrypoints..address=:5480"
    #"--entrypoints..http.redirections.entryPoint.to=web_secure"
    #"--entrypoints..http.redirections.entryPoint.scheme=https"
    # WEB_SECURE entrypoint
    #"--entrypoints..address=:54443"
    #"--entrypoints..http.tls.certResolver=ee-f"
    #"--entrypoints..http.tls.domains[0].main=ee-f.com"
    #"--entrypoints..http.tls.domains[0].sans=*.ee-f.com"
    # Certificate resolver (ee-f.com)
    "--certificatesresolvers.ee-f.acme.email=zito@ee-f.com"
    "--certificatesresolvers.ee-f.acme.storage=/ssl_certificates/acme.json"
    "--certificatesresolvers.ee-f.acme.caServer=https://acme-v02.api.letsencrypt.org/directory"
    "--certificatesresolvers.ee-f.acme.dnschallenge.provider=cloudflare"
  ];
  labels = {
    "traefik.enable" = "true";
    "traefik.http.routers.traefik.entrypoints" = "homeWebSecure";
    "traefik.http.routers.traefik.tls.certresolver" = "ee-f";
    "traefik.http.routers.traefik.rule" = "Host(`traefik.home.ee-f.com`)";
    "traefik.http.routers.traefik.service" = "api@internal";
  };
}
