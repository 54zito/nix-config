{ pkgs, ... }:

{
  zitoConfig = {
    homeDirectory = "/Users/zito";
    modules = {
      home-manager.enable = true;
      fonts.enable = true;
    };
  };

  imports = [
    ./system.nix
    ./scripts.nix
  ];

  environment.systemPackages = with pkgs; [
    htop
    wget
    tree
    google-chrome
    discord
    vscode
  ];

  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    brews = [ "mas" ];
    casks = [ "raspberry-pi-imager" ];
    masApps = {
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Keynote" = 409183694;
      "Slack" = 803453959;
      "WhatsApp" = 310633997;
      "Wireguard" = 1451685025;
    };
    onActivation.cleanup = "uninstall";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  networking = {
    hostName = "arya";
    localHostName = "arya";
    computerName = "Edson's MacBook Air";
  };
}