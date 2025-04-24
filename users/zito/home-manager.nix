{ pkgs, lib, config, ... }:

let
  home-managerConfig = {
    users.zito = {
      home.username = "zito";
      home.homeDirectory = config.customOptions.user.homeDirectory;
      home.stateVersion = "24.11";
      
      imports = [
        ./dots/git.nix
        ./dots/zsh.nix
        ./dots/tmux.nix
      ];
    };
  };
in
{
  options = {
    customOptions.homeManager.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables Home Manager";
    };
  };
  config =  lib.mkIf config.customOptions.homeManager.enable {
    home-manager = home-managerConfig;
  };
}