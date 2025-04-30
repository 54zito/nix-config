{ pkgs, config, inputs, ... }:

{
  system.defaults = {
    controlcenter = {
      AirDrop = true; # Show a AirDrop control in menu bar. Default is null.
      BatteryShowPercentage = true; # Show a battery percentage in menu bar. Default is null.
      Bluetooth = true; # Show a bluetooth control in menu bar. Default is null.
      Display = null; # Show a Screen Brightness control in menu bar. Default is null.
      FocusModes = null; # Show a Focus control in menu bar. Default is null.
      NowPlaying = true; # Show a Now Playing control in menu bar. Default is null.
      Sound = null; # Show a sound control in menu bar . Default is null.
    };
    dock = {
      persistent-apps = [ # Apps to display in dock.
        "/System/Applications/Launchpad.app"
        "${pkgs.alacritty}/Applications/Alacritty.app"
        "${pkgs.google-chrome}/Applications/Google Chrome.app"
        "/System/Applications/Mail.app"
        "/System/Applications/Calendar.app"
        "/Applications/WhatsApp.app"
        "/Applications/Slack.app"
        "${pkgs.discord}/Applications/Discord.app"
        "/Applications/Bitwarden.app"
        "/System/Applications/System Settings.app"
      ];
      persistent-others = [ # Extra apps to display in dock.
        "/Users/zito/Downloads"
      ];
      autohide = true; # Hide dock.
      magnification = false; # Dock icons magnification.
      minimize-to-application = true; # Minimize apps to dock icon instead of a new icon.
      orientation = "bottom"; # Dock position.
      tilesize = 64; # Dock's icons size.
      show-recents = false; # Show recently opened app or dir in dock.
      wvous-tl-corner = 1; # Action for top-left corner.        1 = Disabled, 2 = Mission Control, 3 = App window
      wvous-tr-corner = 1; # Action for top-right corner.       4 = Desktop, 5 = Screen Saver, 6 = Disable Screen Saver
      wvous-bl-corner = 1; # Action for bottom-left corner.     7 = Dashboard, 10 = Put Display to sleep, 11 = Launchpad
      wvous-br-corner = 4; # Action for bottom-right corner.    12 = Notification Center, 13 = Lock Screen, 14 = Quick Note
    };

    finder = {
      AppleShowAllExtensions = true; # Whether to always show file extensions. The default is false.
      AppleShowAllFiles = true; # Whether to always show hidden files. The default is false.
      NewWindowTarget = "Home"; # Change the default folder shown in Finder windows.
      FXPreferredViewStyle = "Nlsv"; # Change the default finder view. "icnv" = Icon view, "Nlsv" = List view, "clmv" = Column View, "Flwv" = Gallery View The default is icnv.
      ShowExternalHardDrivesOnDesktop = true; # Whether to show external disks on desktop. The default is true.
      ShowStatusBar = true; # Show status bar at bottom of finder windows with item/disk space stats. The default is false.
      ShowPathbar = true; # Show path breadcrumbs in finder windows. The default is false.
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark"; # Set to 'Dark' to enable dark mode, or leave unset for normal mode.
      KeyRepeat = 2; # This sets how fast it repeats once it starts.
      InitialKeyRepeat = 20; # This sets how long you must hold down the key before it starts repeating.
      AppleICUForce24HourTime = true; # Whether to use 24-hour or 12-hour time. The default is based on region settings.
    };

    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false; # Automatically install Mac OS software updates. Defaults to false.
  };

  security.pam.enableSudoTouchIdAuth = true; # Whether to enable Touch ID with sudo.

  ###############################################################################################################################
  ###################################################### ACTIVATION SCIPTS ######################################################
  ###############################################################################################################################

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
