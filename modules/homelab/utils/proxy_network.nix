{
  description = "Creates a podman network for traefik proxy.";
  after = [ "podman.service" ];
  requires = [ "podman.service" ];
  wantedBy = [ "multi-user.target" ];
  serviceConfig = {
    Type = "oneshot";
    RemainAfterExit = "yes";
    ExecStart = ''
      /bin/sh -c '/run/current-system/sw/bin/podman network exists proxy \
        || /run/current-system/sw/bin/podman network create proxy'
    '';
    ExecStop = ''
      /bin/sh -c '/run/current-system/sw/bin/podman network rm -f proxy'
    '';
  };
}
