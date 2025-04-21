{ pkgs, inputs, lib, config, ... }:

{
  options = {
    CustomOptions.user.homeDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/zito";
      description = "Path to home directory.";
    };
  };
  config = {
    users.users.zito = {
      name = "zito";
      home = config.CustomOptions.user.homeDirectory;
    };
  };
  imports = [ ./home-manager.nix ];
}