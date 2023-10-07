{ pkgs, ... }:
with pkgs;
let
  shared = import ../shared/pkgs.nix { inherit pkgs; };
  brew = pkgs.callPackage ../customPkgs/darwin/brew { inherit pkgs; };
in shared ++ [ dockutil brew ]
