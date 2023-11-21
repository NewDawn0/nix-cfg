{ pkgs, ... }:
let
  conf = import ../conf.nix;
  inherit (pkgs) stdenv;
in {
  shells = with pkgs; [ bash zsh ];
  loginShell = "${pkgs.zsh}/bin/zsh";
  shellAliases = {
    vi = "${pkgs.neovim}/bin/nvim";
    nixse = "nix search nixpkgs";
    nixgc = "sudo nix-collect-garbage -d";
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
    ollamaup =
      "ollama list | ${pkgs.gawk}/bin/awk -F':' 'NR>1 {print $1}' | ${pkgs.coreutils}/bin/xargs -I {} ollama pull {}";
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
    gdiff = "${pkgs.git}/bin/git diff";
    push = "${pkgs.git}/bin/git push";
    pull = "${pkgs.git}/bin/git pull";
    commit = "${pkgs.git}/bin/git commit -m";
    amend = "${pkgs.git}/bin/git commit --amend -m";
    git-root = "${pkgs.git}/bin/git rev-parse --show-toplevel";
    git-log = "${pkgs.git}/bin/git log --oneline --all";
    wmoff = "launchctl unload ~/Library/LaunchAgents/org.nixos.yabai.plist";
    wmon = "launchctl load ~/Library/LaunchAgents/org.nixos.yabai.plist";
    wmre = "wmoff && wmon";
  };
  extraInit = ''
    unset MAILCHECK
    eval $(${pkgs.thefuck}/bin/thefuck --alias fuck)
    cat /dev/null > /var/mail/${conf.user}
  '';
  interactiveShellInit = ''
    clear
  '';
  variables = {
    DYLD_LIBRARY_PATH =
      if stdenv.isDarwin then [ "/System/Library/Frameworks/" ] else [ ];
    LIBRARY_PATH = [ "${pkgs.libiconv}/lib" "${pkgs.darwin.libobjc}/lib" ]
      ++ (if stdenv.isDarwin then [ "/System/Library/Frameworks/" ] else [ ]);
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    EDITOR = "nvim";
    PAGER = "less";
    LANG = "en_US.UTF-8";
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=${conf.theme.extra.purple},bg=none";
    pathsToLink = [
      "/Applications"
      "/nix/var/nix/profiles/default/bin/"
      "/share/zsh"
      "$HOME/.cargo/bin"
      "/usr/local/texlive/2023/bin/universal-darwin/"
    ];
  };
  systemPackages = import ./sys-pkgs.nix { inherit pkgs; };
}
