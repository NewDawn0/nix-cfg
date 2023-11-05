{ pkgs, ... }:
let conf = import ../../conf.nix;
in {
  programs.eza = {
    enable = conf.home-mods.eza;
    package = pkgs.eza;
    git = true;
    icons = true;
  };
}
