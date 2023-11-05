{ pkgs, ... }:
let
  conf = import ../../conf.nix;
  inherit (pkgs) stdenv;
  stateVersion = "23.05";
in {
  useGlobalPkgs = true;
  useUserPackages = true;
  users.${conf.user}.imports = [
    ({ pkgs, ... }: {
      home = {
        stateVersion = "23.05";
        enableNixpkgsReleaseCheck = false;
        packages = import
          (if stdenv.isDarwin then ../../darwin/pkgs.nix else ../pkgs.nix) {
            inherit pkgs;
          };
      };
      programs.command-not-found.enable = false;
      imports = [
        ./alacritty.nix
        ./bash.nix
        ./bat.nix
        ./bottom.nix
        ./direnv.nix
        ./eza.nix
        ./firefox.nix
        ./git.nix
        ./nu.nix
        ./starship.nix
        ./tmux
        ./vscode.nix
        ./zsh.nix
      ];
    })
  ];
}
