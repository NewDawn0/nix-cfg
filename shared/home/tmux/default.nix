{ pkgs, lib, ... }:
let
  tmux-everblush =
    pkgs.callPackage ../../../customPkgs/shared/tmux-everblush.nix {
      inherit pkgs;
    };
  conf = import ../../../conf.nix;
in {
  programs.tmux = {
    enable = conf.home-mods.tmux;
    clock24 = false;
    historyLimit = 10000;
    mouse = true;
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      yank
      sensible
      vim-tmux-navigator
      tmux-everblush
    ];
    extraConfig = lib.strings.fileContents ./tmux.conf;
  };
}
