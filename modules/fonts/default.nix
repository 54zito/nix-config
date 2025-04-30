{ pkgs, inputs, lib, config, ... }:

let
  customFonts = pkgs.stdenv.mkDerivation {
    name = "Custom fonts";
    src = "${inputs.z-env}/fonts";

    installPhase = ''
      mkdir -p $out/share/fonts
      cp -r $src/* $out/share/fonts/
    '';
  };
in
{
  options = {
    zitoConfig.modules.fonts.enable = lib.mkEnableOption "Enables custom fonts";
  };
  config = lib.mkIf config.zitoConfig.modules.fonts.enable {
    fonts.packages = [ customFonts ];
  };
}
