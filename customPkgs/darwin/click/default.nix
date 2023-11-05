{ pkgs ? import <nixpkgs> { } }:
with pkgs;
stdenv.mkDerivation rec {
  pname = "Autoclick";
  version = "0.1.0";
  src = ./.;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/Applications
    mv ./Autoclick.app $out/Applications
    runHook postInstall
  '';
  meta = with lib; {
    description = "A simple macOS autoclicker";
    platforms = platforms.darwin;
  };
}
