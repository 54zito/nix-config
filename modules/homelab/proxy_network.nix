{
  description = "Create 'proxy' Podman network.";
  after = [ "podman.service" ];
  requires = [ "podman.service" ];
  wantedBy = [ "multi-user.target" ];
  serviceConfig = {
    Type = "oneshot";
    RemainAfterExit = "yes";
    ExecStart = ''
      /run/current-system/sw/bin/podman network create proxy
    '';
  };
}
