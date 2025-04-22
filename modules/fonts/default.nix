{ pkgs, inputs, lib, config, ... }:

let
  customFonts = pkgs.stdenv.mkDerivation {
    name = "Custom fonts";
    src = "${inputs.secrets}/fonts";

    installPhase = ''
      mkdir -p $out/share/fonts
      cp -r $src/* $out/share/fonts/
    '';
  };
in
{
  options = {
    customOptions.modules.fonts.enable = lib.mkEnableOption "Enables custom fonts";
  };
  config = lib.mkIf config.customOptions.modules.fonts.enable {
    fonts.packages = [ customFonts ];
  };
}