{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  VERSION = "0.1.0";
  AUTHOR = "NewDawn0";
  PKG = writeShellScriptBin "walld" ''
    # Helper function
    function help() {
      echo "walld - A wallpaper tool"
      echo " |-> version: ${VERSION}"
      echo " '-> author: ${AUTHOR}"
      echo "walld [options] <Path to wallpaper>"
      echo "OPTIONS"
      echo "  -h | --help  Prints the help menu"
    }
    # Check args 
    if [ "$*" == "" ]; then
        echo "ERROR: No arguments provided"
        help
        exit 1
    fi
    fpath="$1"
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --help | -h)
              help
              exit 0
              ;;
            *)
              fpath="$1"
              shift
              ;;
        esac
    done
    # Check fpath
    if [ ! -f "$fpath" ]; then
        echo "ERROR: File not found $fpath"
        exit 1
    fi
    if ! file --mime-type "$fpath" | grep "image/" >/dev/null; then
        echo "ERROR: Not image: $fpath"
        exit 1
    fi
    # Set wall 
    osascript -e 'tell application "System Events" to tell every desktop to set picture to "'$fpath'"'
    # Check output 
    if [ $? == "0" ]; then
        exit 0
    else
        echo "Failed to set wallapper"
        exit 1
    fi
  '';
in stdenv.mkDerivation rec {
  pname = "walld";
  version = "0.1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp  ${PKG}/bin/walld $out/bin
  '';
  buildInputs = with pkgs; [ coreutils gnugrep file ];
  meta = with lib; {
    description = "Set wallpaper from the cli on macOS";
    platforms = platforms.darwin;
    maintainers = with maintainers; [ NewDawn0 ];
    license = licenses.mit;
  };
}
