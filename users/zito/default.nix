{ pkgs, lib, config, ... }:

{
  options = {
    customOptions.user.homeDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/zito";
      description = "Path to home directory.";
    };
  };
  config = {
    users.users.zito = {
      name = "zito";
      home = config.customOptions.user.homeDirectory;
      shell = pkgs.zsh;
    };
  };
  imports = [ ./home-manager.nix ];
}