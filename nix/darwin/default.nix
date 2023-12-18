{ inputs, current, pkgs, unstable, ... }:
let fh = inputs.fh.packages.${current.arch}.default;
in {
  environment.systemPackages =
    import ./../shared/pkgs.nix { inherit fh pkgs unstable; };
  fonts = import ./../shared/fonts.nix { inherit pkgs; };
  imports = [ ./brew.nix ./system.nix ./../shared/sh-env.nix ];
  programs = {
    man.enable = true;
    nix-index.enable = true;
    zsh = {
      enable = true;
      enableBashCompletion = false;
      enableCompletion = true;
      enableFzfCompletion = false;
      enableFzfHistory = true;
      enableSyntaxHighlighting = true;
    };
    bash = {
      enable = true;
      enableCompletion = true;
    };
    tmux = {
      enable = true;
      enableMouse = true;
    };
  };
  services = {
    emacs.enable = true;
    nix-daemon.enable = true;
  };
}
