{ pkgs, inputs, lib, config, ... }:

let
  zito-dots = ../../users/zito/dots;
  home-managerConfig = {
    users.zito = {
      home.username = "zito";
      home.homeDirectory = config.zitoConfig.homeDirectory;
      home.stateVersion = "24.11";
      imports = [
        "${zito-dots}/git.nix"
        "${zito-dots}/zsh.nix"
        "${zito-dots}/tmux.nix"
        "${zito-dots}/alacritty.nix"
        inputs.nixvim-darwin.homeManagerModules.nixvim
        ./nixvim
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