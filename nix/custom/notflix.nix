{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  VERSION = "v0.1.0";
  AUTHOR = "NewDawn0";
  COL_PURPLE = "\\x1b[35;1m";
  COL_CYAN = "\\x1b[36;1m";
  COL_BLUE = "\\x1b[34;1m";
  COL_YELLOW = "\\x1b[33;1m";
  COL_NC = "\\x1b[0m";
  curl = "${pkgs.curl}/bin/curl";
  grep = "${pkgs.gnugrep}/bin/grep";
  tr = "${pkgs.coreutils}/bin/tr";
  head = "${pkgs.coreutils}/bin/head";
  echo = "${pkgs.coreutils}/bin/echo";
  uniq = "${pkgs.coreutils}/bin/uniq";
  printf = "${pkgs.coreutils}/bin/printf";
  webtorrent = "${pkgs.nodePackages.webtorrent-cli}/bin/webtorrent";
  PKG = writeShellScriptBin "notflix" ''
    # Init vars
    webtorrent_args=""
    query=""

    # Parse args
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --help | -h)
              ${echo} -e "${COL_PURPLE}notflix - A cli torrent streamer${COL_NC}"
              ${echo} "Version: ${VERSION}"
              ${echo} "Author: ${AUTHOR}"
              ${echo} ""
              ${echo} -e "${COL_PURPLE}USAGE:${COL_NC}"
              ${echo} -e "  $ ${COL_CYAN}notflix${COL_NC} [${COL_BLUE}options${COL_NC}] ${COL_BLUE}query${COL_NC} # or -,"
              ${echo} -e "  $ ${COL_CYAN}notflix${COL_NC}                 #  <--'"
              ${echo} ""
              ${echo} -e "${COL_PURPLE}OPTIONS:${COL_NC}"
              ${echo} -e "  ${COL_BLUE}--webtorrent-args${COL_NC} <${COL_YELLOW}String${COL_NC}>"
              ${echo} "    See \`https://github.com/cargo12/webtorrent-cli\` for available args"
              exit 0
              ;;
            --webtorrent-args)
              shift
              webtorrent_args="$1"
              shift
              ;;
            *)
              query+="$1+"
              shift
              ;;
        esac
    done

    # Ask user if no query provided
    if [ -z "$query" ]; then
        ${printf} '%bEnter query: %b' "${COL_PURPLE}" "${COL_NC}"
        read query
    fi

    # Cleanse the search query
    query=$(${printf} '%s' "$query" | ${tr} ' ' '+' )

    # Search
    movie=$(${curl} -s https://1337x.to/search/$query/1/ | ${grep} -Eo 'torrent/[0-9]{7}/[a-zA-Z0-9?%-]*/' | ${head} -n 1)
    magnet=$(${curl} -s https://1337x.to/$movie | ${grep} -Po 'magnet:\?xt=urn:btih:[^"]*' | ${uniq} | ${head} -n 1)

    # Run
    if [ -n "$webtorrent_args"  ]; then
        ${webtorrent} "$webtorrent_args" "$magnet"
    else
        ${webtorrent} "$magnet"
    fi
  '';
in stdenv.mkDerivation rec {
  pname = "notflix";
  version = "0.1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp  ${PKG}/bin/notflix $out/bin
  '';
  meta = with lib; {
    description = ''
      notflix - A cli torrent streamer
      -> Based on https://github.com/Bugswriter/notflix'';
    homepage = "https://github.com/Bugswriter/notflix";
    maintainers = with maintainers; [ "NewDawn0" ];
    license = licenses.mit;
  };
}
