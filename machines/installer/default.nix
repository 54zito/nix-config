{ pkgs, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
  nix.settings.experimental-features = "nix-command flakes";
  services.openssh.enable = true;
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOdql6mn2PV9t6hKcalKQ8v8f+5G0yLfVsgpC9hAH/fg zito@arya"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDWPROBi9Zpi2SrTm8b+i0XalEK+f4fNKyhU9nGGWOTL zito@myrcella"
  ];
  environment.systemPackages = with pkgs; [ disko exfatprogs pciutils git htop neofetch ];
        }
