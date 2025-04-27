{ ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight = {
      enable = true;
      settings.flavour = "night";
    };
    imports = [
      ./options.nix
      ./keymaps.nix
      ./plugins
    ];
  };
}
