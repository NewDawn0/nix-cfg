{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation rec {
  pname = "brew-manager";
  version = "v0.1.0"; # Just nixpkg version not brew version
  src = ./src;
  buildInputs = with pkgs; [ git curl bash ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/${pname}.sh $out/bin/${pname}
    chmod +x $out/bin/${pname}
  '';
}
