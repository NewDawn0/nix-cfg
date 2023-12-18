{ fh, pkgs, unstable, ... }:
with pkgs;
let
  inherit (pkgs) stdenv;
  note = callPackage ./../custom/note { inherit pkgs; };
  notflix = callPackage ./../custom/notflix.nix { inherit pkgs; };
in [
  bash-completion
  colima
  cpufetch
  curl
  didyoumean
  discord
  docker
  fd
  ffmpeg
  fh
  figlet
  file
  fzf
  gawk
  gcc
  gh
  gimp
  git-lfs
  gnugrep
  gnupg
  gnused
  gnutar
  go
  gzip
  hexedit
  imagemagick
  jetbrains.idea-community
  jq
  killall
  libiconv
  nasm
  ncdu
  neofetch
  neovim
  nodePackages.nodemon
  nodePackages.prettier
  nodejs
  note
  notflix
  onefetch
  openjdk
  openssh
  openssl
  p7zip
  pinentry
  python3
  qemu
  rar
  ripgrep
  thefuck
  typos
  unstable.ani-cli
  unstable.eza
  unzip
  vim
  wget
  wget
  yt-dlp
  zip
  zsh
] # Darwin ↓
++ (if stdenv.isDarwin then
  with pkgs.darwin;
  let
    brew-manager = callPackage ./../custom/brew-manager { inherit pkgs; };
    click = callPackage ./../custom/click { inherit pkgs; };
    later = callPackage ./../custom/later { inherit pkgs; };
    walld = callPackage ./../custom/walld.nix { inherit pkgs; };
  in [ brew-manager click later walld libobjc ]
  ++ (builtins.attrValues apple_sdk.frameworks)

else
  [ ]) # Linux ↓
++ (if stdenv.isLinux then [ ] else [ ])
