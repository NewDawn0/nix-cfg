{
  homebrew = {
    enable = true;
    global.autoUpdate = false;
    taps = [{
      name = "lencx/chatgp";
      clone_target = "https://github.com/lencx/ChatGPT.git";
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
    brews = [ "ollama" ];
    casks = import ./casks.nix;
  };
}
