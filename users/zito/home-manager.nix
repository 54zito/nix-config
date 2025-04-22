{ pkgs, inputs, config, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = false;
  home-manager.users.zito = {
    imports = [
      ./dots/git.nix
      ./dots/zsh.nix
    ];
    home.username = "zito";
    home.homeDirectory = config.customOptions.user.homeDirectory;
    home.stateVersion = "24.11";
  };
}