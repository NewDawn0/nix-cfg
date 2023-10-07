{ pkgs, lib, ... }:
let
  tmux-everblush = pkgs.callPackage ../../customPkgs/darwin/tmux-everblush.nix {
    inherit pkgs;
  };
in {
  programs.tmux = {
    enable = true;
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
    extraConfig = lib.strings.fileContents ../../cfg/tmux.conf;
  };
}
