{
  homebrew = {
    enable = true;
    global.autoUpdate = false;
    taps = [
      "homebrew/services"
      {
        name = "lencx/chatgp";
        clone_target = "https://github.com/lencx/ChatGPT.git";
      }
    ];
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
      MsExcel = 462058435;
      MsOutlook = 985367838;
      MsPowerPoint = 462062816;
      MsWord = 462054704;
      # Shazam = 897118787;
      Xcode = 497799835;
    };
    casks = [
      "amethyst"
      "appcleaner"
      "balenaetcher"
      "blender"
      "blockbench"
      "chatgpt"
      "firefox"
      "github"
      "iina"
      "languagetool"
      "mactex"
      "obsidian"
      "prismlauncher"
      "raycast"
      "tor-browser"
      "vlc"
      "whatsapp"
    ];
  };
}
