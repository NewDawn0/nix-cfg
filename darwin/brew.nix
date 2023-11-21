{
  homebrew = {
    enable = true;
    global.autoUpdate = false;
    taps = [{
      name = "lencx/chatgp";
      clone_target = "https://github.com/lencx/ChatGPT.git";
    }];
    brews = [{
      name = "ollama";
      args = [ "HEAD" ];
      restart_service = "changed";
    }];
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    masApps = {
      Xcode = 497799835;
      Shazam = 897118787;
    };
    casks = import ./casks.nix;
  };
}
