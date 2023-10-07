{ pkgs, ... }:
let
  conf = import ./conf.nix;
  inherit (pkgs) stdenv;
in {
  shells = with pkgs; [ bash zsh ];
  loginShell = "${pkgs.zsh}/bin/zsh";
  shellAliases = {
    nixse = "nix search nixpkgs";
    nixgc = "nix-colllect-garbage";
    nixup = ''
      _this_=$(pwd)
      cd ${conf.nix-conf-dir}\
          && nix-channel --update \
          && nix flake update \
          && darwin-rebuild switch --flake . \
          && printf "\x1b[34;1mSYSTEM\x1b[0m -- Restart your system to apply all changes\n" \
          && cd $_this \
          && unset _this
    '';
    cargoup = "cargo install-update -a";
    cargoin = "cargo binstall";
    cargorm = "cargo uninstall";
    ls = "${pkgs.eza}/bin/eza";
    lt = "${pkgs.eza}/bin/eza -T --color=always --group-directories-first";
    grep = "${pkgs.gnugrep}/bin/grep --color=auto";
    mv = "${pkgs.coreutils}/bin/mv -i";
    cp = "${pkgs.coreutils}/bin/cp -i";
    vim = "${pkgs.neovim}/bin/nvim";
    mk-song =
      "${pkgs.yt-dlp}/bin/yt-dlp -x --audio-format mp3 --embed-thumbnail";
    add = "${pkgs.git}/bin/git add";
    push = "${pkgs.git}/bin/git push";
    pull = "${pkgs.git}/bin/git pull";
    commit = "${pkgs.git}/bin/git commit -m";
    ammend = "${pkgs.git}/bin/git commit --amend -m";
    git-root = "${pkgs.git}/bin/git rev-parse --show-toplevel";
    git-log = "${pkgs.git}/bin/git log --oneline --all";
    wmoff = "launchctl unload ~/Library/LaunchAgents/org.nixos.yabai.plist";
    wmon = "launchctl load ~/Library/LaunchAgents/org.nixos.yabai.plist";
    wmre = "wmoff && wmon";
  };
  extraInit = ''
    unset MAILCHECK
    cat /dev/null > /var/mail/${conf.user}
  '';
  interactiveShellInit = ''
    clear
  '';
  variables = {
    EDITOR = "nvim";
    PAGER = "less";
    LANG = "en_US.UTF-8";
    pathsToLink = [
      "/Applications"
      "/nix/var/nix/profiles/default/bin/"
      "/share/zsh"
      "$HOME/.cargo/bin"
    ];
  };
  systemPackages = import ./sys-pkgs.nix { inherit pkgs; };
}
