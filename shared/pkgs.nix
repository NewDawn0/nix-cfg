{ pkgs, ... }:
with pkgs;
let
  note = callPackage ../customPkgs/shared/note { inherit pkgs; };
  notflix = callPackage ../customPkgs/shared/notflix.nix { inherit pkgs; };
in [
  # General
  act
  ani-cli
  (aspellWithDicts (dicts: with dicts; [ en en-computers en-science de fr ]))
  bash-completion
  gcc
  killall
  neofetch
  onefetch
  niv
  openssh
  wget
  zip
  # Apps
  jetbrains.idea-community
  discord
  gimp
  # Encryption
  cacert
  gnupg
  tor
  # Clound & Isolation
  docker
  docker-compose
  ngrok
  terraform
  qemu
  # Media
  ffmpeg
  imagemagick
  # Shell
  hexedit
  cpufetch
  typos
  colima
  docker
  fd
  figlet
  file
  fzf
  jq
  pkg-config
  ripgrep
  thefuck
  tree
  gnused
  ncdu
  # Langs
  go # Go
  nodePackages.nodemon # JavaScript
  nodePackages.prettier # JavaScript
  nodePackages.node2nix # JavaScript
  nodePackages.npm # JavaScript
  nodejs # JavaScript
  python3 # Python
  virtualenv # Python
  # rustup # Rust
  # jre8 # Java
  # jdk17 # Java
  openjdk
  # Git
  gh
  git-lfs
  # Libs
  # libiconv
  # Custom
  note
  notflix
]
