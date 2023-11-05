{ pkgs, ... }: {
  services.nix-daemon.enable = true;
  imports = [ ../shared/nix.nix ./system.nix ./brew.nix ./skhd ];
  environment = import ../shared/env.nix { inherit pkgs; };

  fonts = import ../shared/fonts.nix { inherit pkgs; };
  services = {
    emacs.enable = true;
    # skhd = import ./skhd.nix { inherit pkgs; };
    yabai = import ./yabai.nix { inherit pkgs; };
    # khd = import ./khd.nix { inherit pkgs; };
    # spacebar = import ./spacebar.nix { inherit pkgs; };
  };
  programs = {
    # Shells
    zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = false;
      enableFzfCompletion = false;
      enableFzfHistory = true;
      enableSyntaxHighlighting = true;
    };
    bash = {
      enable = true;
      enableCompletion = true;
    };
    # Shell tools
    tmux = {
      enable = true;
      enableMouse = true;
    };
    # Docs
    man.enable = true;
    info.enable = true;
    # Nix
    nix-index.enable = true;
  };
}
