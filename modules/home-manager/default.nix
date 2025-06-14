{ pkgs, inputs, lib, config, ... }:

let
  zito-dots = ../../users/zito/dots;
  home-managerConfig = {
    users.zito = {
      home.username = config.zitoConfig.userName;
      home.homeDirectory = config.zitoConfig.homeDirectory;
      home.stateVersion = "25.05";
      imports = [
        "${zito-dots}/git.nix"
        "${zito-dots}/zsh.nix"
      ];
    };
  };
in
{
  options = {
    zitoConfig.modules.home-manager.enable = lib.mkEnableOption "Enables Home-manager";
  };
  config =  lib.mkIf config.zitoConfig.modules.home-manager.enable {
    home-manager = home-managerConfig;
  };
}