{ pkgs, ... }:
let conf = import ../conf.nix;
in {
  name = "${conf.user}";
  home = "${conf.home}";
  isHidden = false;
  shell = pkgs.zsh;
}
