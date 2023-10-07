{ pkgs, ... }:
with pkgs; [
  # General
  act
  ani-cli
  (aspellWithDicts (dicts: with dicts; [ en en-computers en-science de fr ]))
  bash-completion
  bat
  btop
  gcc
  killall
  neofetch
  openssh
  wget
  zip
  # Apps
  jetbrains.idea-community
  vscode
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
  bat
  bottom
  colima
  docker
  fd
  fzf
  jq
  ripgrep
  tree
  tmux
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
  jdk17 # Java
  # Git
  gh
]
