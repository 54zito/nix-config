{
  autoStart = true;
  image = "docker.io/traefik:v3.5.2";
  volumes = [ 
    "/run/podman/podman.sock:/var/run/docker.sock:ro"
    "/etc/localtime:/etc/localtime:ro"
    "/persistant/services/traefik/keys:/api_keys:ro"
    "/persistant/services/traefik/ssl:/ssl_certificates"
  ];
  networks = [ "proxy" ];
  ports = [ 
    "80:80"
    "443:443"
    "5480:5480"
    "54443:54443"
    #"8080:8080" # api.insecure
  ];
  environment = {
    CLOUDFLARE_DNS_API_TOKEN_FILE = "/api_keys/dns.key";
    CLOUDFLARE_ZONE_API_TOKEN_FILE = "/api_keyszone.key";
  };
  cmd = [
    # Dashboard
    "--api.dashboard=true"
    #"--api.insecure=true"

    # Provider
    "--providers.docker.exposedByDefault=false"

    # HOME entrypoint
    "--entrypoints.home.address=:80"
    "--entrypoints.home.http.redirections.entryPoint.to=home_secure"
    "--entrypoints.home.http.redirections.entryPoint.scheme=https"

    # HOME_SECURE entrypoint
    "--entrypoints.home_secure.address=:443"
    "--entrypoints.home_secure.http.tls.certResolver=ee-f"
    "--entrypoints.home_secure.http.tls.domains[0].main=home.ee-f.com"
    "--entrypoints.home_secure.http.tls.domains[0].sans=*.home.ee-f.com"

    # WEB entrypoint
    "--entrypoints.web.address=:5480"
    "--entrypoints.web.http.redirections.entryPoint.to=web_secure"
    "--entrypoints.web.http.redirections.entryPoint.scheme=https"

    # WEB_SECURE entrypoint
    "--entrypoints.web_secure.address=:54443"
    "--entrypoints.web_secure.http.tls.certResolver=ee-f"
    "--entrypoints.web_secure.http.tls.domains[0].main=ee-f.com"
    "--entrypoints.web_secure.http.tls.domains[0].sans=*.ee-f.com"

    # Certificate resolver (ee-f.com)
    "--certificatesresolvers.ee-f.acme.email=zito@ee-f.com"
    "--certificatesresolvers.ee-f.acme.storage=/ssl_certificates/acme.json"
    "--certificatesresolvers.ee-f.acme.caServer=https://acme-v02.api.letsencrypt.org/directory"
    "--certificatesresolvers.ee-f.acme.dnschallenge.provider=cloudflare"
  ];
  labels = {
    "traefik.enable" = "true";
    "traefik.http.routers.traefik.entrypoints" = "home_secure";
    "traefik.http.routers.traefik.tls.certresolver" = "ee-f";
    "traefik.http.routers.traefik.rule" = "Host(`traefik.home.ee-f.com`)";
    "traefik.http.routers.traefik.service" = "api@internal";
  };
}
