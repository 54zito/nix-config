{ pkgs, ... }:

{
  users.users.zito = {
    isNormalUser = true;
    extraGroups = [ "wheel" "podman" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOdql6mn2PV9t6hKcalKQ8v8f+5G0yLfVsgpC9hAH/fg zito@arya" ];
  };
}
