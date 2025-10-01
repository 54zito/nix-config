{
  description = "Creates an ipvlan podman network.";
  after = [ "podman.service" ];
  requires = [ "podman.service" ];
  wantedBy = [ "multi-user.target" ];
  serviceConfig = {
    Type = "oneshot";
    RemainAfterExit = "yes";
    ExecStart = ''
      /bin/sh -c '/run/current-system/sw/bin/podman network exists home \
        || /run/current-system/sw/bin/podman network create \
           --driver="ipvlan" \
           --subnet="192.168.1.0/24" \
           --gateway="192.168.1.1" \
           -o parent="enp3s0f0" \
           home'
    '';
    ExecStop = ''
      /bin/sh -c '/run/current-system/sw/bin/podman network rm -f home'
    '';
  };
}
