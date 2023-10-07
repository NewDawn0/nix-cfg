{ pkgs, ... }:
let conf = import ../shared/conf.nix;
in {
  documentation = {
    enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
  };
  security.pam.enableSudoTouchIdAuth = true;
  networking = {
    computerName = "${conf.hostname}";
    hostName = "${conf.hostname}";
    localHostName = "${conf.hostname}";
    dns = [ "8.8.8.8" "208.67.220.220" "208.67.222.222" ];
    knownNetworkServices =
      [ "USB 10/100/1000 LAN" "Thunderbolt Bridge" "Wi-Fi" "iPhone USB" ];
  };
  system = {
    stateVersion = 4;
    checks.verifyNixPath = false;
    keyboard.enableKeyMapping = true;
    defaults = {
      LaunchServices = { LSQuarantine = false; };
      NSGlobalDomain = {
        AppleFontSmoothing = 2;
        AppleInterfaceStyleSwitchesAutomatically = false;
        AppleShowAllExtensions = true;
        AppleScrollerPagingBehavior = false;
        AppleShowAllFiles = false;
        AppleShowScrollBars = "Automatic";
        AppleTemperatureUnit = "Celsius";
        AppleMetricUnits = 1;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSAutomaticCapitalizationEnabled = true;
        NSAutomaticDashSubstitutionEnabled = true;
        NSAutomaticPeriodSubstitutionEnabled = true;
        NSAutomaticQuoteSubstitutionEnabled = true;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = true;
        NSDisableAutomaticTermination = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSScrollAnimationEnabled = true;
        NSTableViewDefaultSizeMode = 1;
        NSTextShowsControlCharacters = false;
        NSUseAnimatedFocusRing = true;
        NSWindowResizeTime = 1.0e-3;
        _HIHideMenuBar = false;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.sound.beep.volume" = 0.25;
        "com.apple.springing.delay" = 0.5;
        "com.apple.springing.enabled" = true;
        "com.apple.swipescrolldirection" = true;
        "com.apple.trackpad.enableSecondaryClick" = true;
      };
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
      alf = {
        allowdownloadsignedenabled = 1; # Firewall
        globalstate =
          1; # 0 = disabled, 1 = enabled, 2 = block all conns except essential
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        launchanim = true;
        magnification = false;
        mineffect = "scale";
        orientation = "left";
        showhidden = true;
        show-recents = false;
        show-process-indicators = false;
        appswitcher-all-displays = false;
        mru-spaces = false;
        tilesize = 48;
        wvous-br-corner = 1;
        wvous-tr-corner = 2;
      };
      finder = {
        CreateDesktop = false; # Desktop icons
        FXPreferredViewStyle = "clmv";
        ShowPathbar = false;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = false;
      };
      loginwindow = {
        GuestEnabled = false;
        PowerOffDisabledWhileLoggedIn = false;
        RestartDisabledWhileLoggedIn = false;
        RestartDisabled = false;
        SHOWFULLNAME = false;
        ShutDownDisabled = false;
        ShutDownDisabledWhileLoggedIn = false;
        SleepDisabled = false;
        autoLoginUser = "Off";
      };
      menuExtraClock = {
        Show24Hour = false;
        ShowAMPM = true;
        ShowDate = 0;
        ShowDayOfMonth = true;
        ShowDayOfWeek = true;
        ShowSeconds = true;
      };
      screencapture = {
        disable-shadow = false;
        location = "${conf.pic-dir}";
        type = "png";
      };
      screensaver.askForPassword = true;
      spaces.spans-displays = false;
      trackpad = {
        Clicking = true;
        Dragging = false;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = false;
        ActuationStrength = 0;
      };
    };
  };
}
