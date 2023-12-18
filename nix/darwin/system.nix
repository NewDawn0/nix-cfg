{ current, ... }: {
  documentation = {
    doc.enable = true;
    enable = true;
    info.enable = true;
    man.enable = true;
  };
  networking = {
    computerName = "${current.hostname}";
    hostName = "${current.hostname}";
    localHostName = "${current.hostname}";
  };
  security.pam.enableSudoTouchIdAuth = true;
  system = {
    checks.verifyNixPath = false;
    defaults = {
      alf = {
        allowdownloadsignedenabled = 1; # Firewall
        globalstate =
          1; # 0 = disabled, 1 = enabled, 2 = block all conns except essential
      };
      dock = {
        appswitcher-all-displays = false;
        autohide = true;
        autohide-delay = 0.0;
        launchanim = true;
        magnification = false;
        mineffect = "scale";
        mru-spaces = false;
        orientation = "left";
        show-process-indicators = false;
        show-recents = false;
        showhidden = true;
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
      LaunchServices = { LSQuarantine = false; };
      loginwindow = {
        GuestEnabled = false;
        PowerOffDisabledWhileLoggedIn = false;
        RestartDisabled = false;
        RestartDisabledWhileLoggedIn = false;
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
      NSGlobalDomain = {
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.sound.beep.volume" = 0.25;
        "com.apple.springing.delay" = 0.5;
        "com.apple.springing.enabled" = true;
        "com.apple.swipescrolldirection" = true;
        "com.apple.trackpad.enableSecondaryClick" = true;
        AppleFontSmoothing = 2;
        AppleInterfaceStyleSwitchesAutomatically = false;
        AppleMetricUnits = 1;
        AppleScrollerPagingBehavior = false;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = false;
        AppleShowScrollBars = "Automatic";
        AppleTemperatureUnit = "Celsius";
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
      };
      screencapture = {
        disable-shadow = false;
        location = "/Users/" + "${current.user}" + "/Pictures";
        type = "png";
      };
      screensaver.askForPassword = true;
      spaces.spans-displays = false;
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
      trackpad = {
        ActuationStrength = 0;
        Clicking = true;
        Dragging = false;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = false;
      };
    };
    keyboard.enableKeyMapping = true;
    stateVersion = 4;
  };
}
