{ pkgs, lib, config, ... }:

{
  options = {
    zitoConfig.homeDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/zito";
      description = "Path to home directory.";
    };
  };
  config = {
    users.users.zito = {
      name = "zito";
      home = config.zitoConfig.homeDirectory;
    };
  };
}