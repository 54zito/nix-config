{ pkgs, config, inputs, ... }:

{
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "Make aliases for nix apps";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "Setting up Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
      app_name=$(basename "$src")
      echo "copying $src" >&2
      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';

  system.activationScripts.postActivation.text = ''
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "${inputs.z-env}/wallpapers/silk_tree.jpg"'
  '';
}