{ lib, ... }:

{
  imports = [
    ./homelab # Disabled by default, 'ZConfig.homelab.enable = true;' to enable.
  ];
}
