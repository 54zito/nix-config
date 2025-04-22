{ lib, ... }:

{
  imports = [
    ./fonts
  ];

  customOptions.modules = {
    fonts.enable = lib.mkDefault false;
  };
}