{ pkgs, inputs, config, ... }:

{
  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;
  home-manager.users.zito = {
    imports = [
      ./dots/git.nix
      ./dots/zsh.nix
    ];
    home.username = "zito";
    home.homeDirectory = config.CustomOptions.user.homeDirectory;
    home.stateVersion = "24.11";
  };
}