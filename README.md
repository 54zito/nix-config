# nix-config
Nix (OS &amp; darwin) configuration files for my machines.

# MacOS

This configuration assumes homebrew, rosetta and the apple command line tools are installed.

'nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake .#arya'
'darwin-rebuild switch --flake .#arya'