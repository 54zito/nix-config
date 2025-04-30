{ pkgs, ... }:

{
  zitoConfig = {
    homeDirectory = "/Users/zito";
    modules = {
      fonts.enable = true;
      home-manager.enable = true;
    };
  };

  imports = [
    ./system.nix
  ];

  environment.systemPackages = with pkgs; [
    htop
    wget
    tree
    ripgrep
    
    alacritty
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
      "Bitwarden" = 1352778147;
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