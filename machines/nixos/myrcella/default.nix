{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "myrcella";
  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";

  #ZConfig.homelab.enable = true;
  
  environment.systemPackages = with pkgs; [ nano tree htop neofetch git tmux ];

  services.openssh.enable = true;

  system.stateVersion = "25.05";
}
