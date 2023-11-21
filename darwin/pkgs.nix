{ pkgs, ... }:
with pkgs;
let
  shared = import ../shared/pkgs.nix { inherit pkgs; };
  brew = callPackage ../customPkgs/darwin/brew { inherit pkgs; };
  later = callPackage ../customPkgs/darwin/later { inherit pkgs; };
  click = callPackage ../customPkgs/darwin/click { inherit pkgs; };
  walld = callPackage ../customPkgs/darwin/walld.nix { inherit pkgs; };
in shared ++ [ dockutil brew later click walld ]
