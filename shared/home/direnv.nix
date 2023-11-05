{ pkgs, ... }:
let conf = import ../../conf.nix;
in {
  programs.direnv = {
    enable = conf.home-mods.direnv;
    package = pkgs.direnv;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };
}
