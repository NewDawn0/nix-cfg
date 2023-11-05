{ pkgs ? import <nixpkgs> { } }:
with pkgs;
stdenv.mkDerivation rec {
  pname = "later";
  version = "0.1.0";
  src = ./.;
  buildInputs = with pkgs; [ undmg ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/Applications
    undmg ./Later.dmg
    mv ./Later.app $out/Applications
    runHook postInstall
  '';
  meta = with lib; {
    description = "Hide applications for a certain duration";
    homepage = "https://getlater.app";
    platforms = platforms.darwin;
  };
}
