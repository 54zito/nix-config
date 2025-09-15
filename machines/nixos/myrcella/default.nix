{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "myrcella";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [ tree htop git ];

  services.openssh.enable = true;

  system.stateVersion = "25.05";
}
