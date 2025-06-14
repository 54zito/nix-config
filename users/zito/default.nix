{ pkgs, lib, config, ... }:

{
  options = {
    zitoConfig.userName = lib.mkOption {
      type = lib.types.str;
      default = "zito";
      description = "User name.";
    };
    zitoConfig.homeDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/zito";
      description = "Path to home directory.";
    };
  };
  config = {
    users.users.zito = {
      name = config.zitoConfig.userName;
      home = config.zitoConfig.homeDirectory;
    };
  };
}