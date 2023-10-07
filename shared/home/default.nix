{ pkgs, ... }:
let
  conf = import ../conf.nix;
  inherit (pkgs) stdenv;
in {
  useGlobalPkgs = true;
  users.${conf.user} = { pkgs, ... }: {
    home = {
      stateVersion = "23.05";
      packages = import
        (if stdenv.isDarwin then ../../darwin/pkgs.nix else ../pkgs.nix) {
          inherit pkgs;
        };
      enableNixpkgsReleaseCheck = false;
    };
    programs = { };
    imports = [ ./zsh.nix ./starship.nix ./tmux.nix ./git.nix ./alacritty.nix ];
  };
}
