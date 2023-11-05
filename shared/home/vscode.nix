{ pkgs, ... }:
let conf = import ../../conf.nix;
in {
  programs.vscode = {
    enable = conf.home-mods.vscode;
    extensions = with pkgs.vscode-extensions; [
      astro-build.astro-vscode
      bradlc.vscode-tailwindcss
      davidlday.languagetool-linter
      dracula-theme.theme-dracula
      eamodio.gitlens
      golang.go
      hashicorp.terraform
      haskell.haskell
      irongeek.vscode-env
      james-yu.latex-workshop
      mhutchie.git-graph
      ms-pyright.pyright
      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter
      ms-vscode.hexeditor
      ms-vscode.makefile-tools
      ms-vscode.powershell
      naumovs.color-highlight
      redhat.java
      redhat.vscode-xml
      redhat.vscode-yaml
      ritwickdey.liveserver
      rust-lang.rust-analyzer
      sumneko.lua
      tiehuis.zig
      timonwong.shellcheck
      vscjava.vscode-gradle
      vscodevim.vim
      zhwu95.riscv
    ];
  };
}
