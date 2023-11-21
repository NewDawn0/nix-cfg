{ pkgs, ... }:
with pkgs; [
  # Editor
  vim
  neovim
  # Shell
  zsh
  curl
  wget
  coreutils
  # Additional shell tool
  eza
  gnugrep
  gnutar
  gzip
  p7zip
  unzip
  rar
  yt-dlp
  zstd
  # libs
  libiconv
]
