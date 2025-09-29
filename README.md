# nix-config
Nix (OS &amp; darwin) configuration files for my machines.

### NIXOS INSTALATION

Set the hostname of the system to install.
```
export HOSTNAME_TO_INSTALL=myrcella
```

Disk partitioning will be done using 'disko'.
```
curl https://raw.githubusercontent.com/54zito/nix-config/refs/heads/main/machines/nixos/$HOSTNAME_TO_INSTALL/disko.nix -o /tmp/disko.nix

disko -m destroy,format,mount /tmp/disko.nix
```
Install the desired config.
```
nixos-install \
--root /mnt \
--flake github:54zito/nix-config#$HOSTNAME_TO_INSTALL
```
