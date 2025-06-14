{ pkgs, config, ... }:

{
  system.primaryUser = config.zitoConfig.userName;

  system.defaults = {
    controlcenter = {
      AirDrop = true;
      BatteryShowPercentage = true;
      Bluetooth = true;
      NowPlaying = true;
    };

    dock = {
      persistent-apps = [
        "/System/Applications/Launchpad.app"
        "/System/Applications/Utilities/Terminal.app"
        "${pkgs.google-chrome}/Applications/Google Chrome.app"
        "/System/Applications/Mail.app"
        "/System/Applications/Calendar.app"
        "/Applications/WhatsApp.app"
        "/Applications/Slack.app"
        "${pkgs.discord}/Applications/Discord.app"
        "/System/Applications/System Settings.app"
      ];
      persistent-others = [
        "/Users/zito/Downloads"
      ];
      autohide = true;
      show-recents = false;
      minimize-to-application = true;
      wvous-tl-corner = 1; # Action for top-left corner.        1 = Disabled, 2 = Mission Control, 3 = App window
      wvous-tr-corner = 1; # Action for top-right corner.       4 = Desktop, 5 = Screen Saver, 6 = Disable Screen Saver
      wvous-bl-corner = 1; # Action for bottom-left corner.     7 = Dashboard, 10 = Put Display to sleep, 11 = Launchpad
      wvous-br-corner = 4; # Action for bottom-right corner.    12 = Notification Center, 13 = Lock Screen, 14 = Quick Note
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      NewWindowTarget = "Home";
      FXPreferredViewStyle = "Nlsv";
      ShowStatusBar = true;
      ShowPathbar = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      InitialKeyRepeat = 20;
    };
  };
  security.pam.services.sudo_local.touchIdAuth = true;

}
