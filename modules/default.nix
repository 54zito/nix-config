{ lib, ... }:

{
  imports = [
    ./fonts
    ./home-manager
  ];

  zitoConfig.modules = {
    fonts.enable = lib.mkDefault false;
    home-manager.enable = lib.mkDefault false;
  };
}