{ pkgs, unstable, current, ... }:
let conf = import ./../../config.nix;
in {
  environment = {
    loginShell = "zsh";
    systemPackages = with pkgs; [ coreutils ];
    shells = with pkgs; [ bash zsh ];
    shellAliases = {
      cargoin = "cargo binstall";
      cargorm = "cargo uninstall";
      cargoup = "cargo install-update -a";
      cp = "cp -i";
      gadd = "git add";
      gamend = "git commit --amend -m";
      gstat = "git status";
      gcom = "git commit -m";
      gdiff = "git diff";
      glog = "git log --oneline --all";
      gpull = "git pull";
      gpush = "git push";
      grep = "grep --color=auto";
      groot = "git rev-parse --show-toplevel";
      ls = "eza";
      lt = "eza -T --color=always --group-directories-first";
      mk-song = "yt-dlp -x --audio-format mp3 --embed-thumbnail";
      mv = "mv -i";
      nixgc = "sudo nix-collect-garbage -d";
      nixse = "nix search nixpkgs";
      nixup = ''
            && cd $_this \
            && darwin-rebuild switch --flake . --fallback \
            && nix flake update \
            && nix-channel --update \
            && nix-store --optimise \
            && printf "\x1b[34;1mSYSTEM\x1b[0m -- Restart your system to apply all changes\n" \
            && sudo nix-collect-garbage -d \
            && unset _this
        _this_=$(pwd)
        cd ${conf.nix-dir}\
      '';
      ollamaup =
        "ollama list | awk -F':' 'NR>1 {print $1}' | xargs -I {} ollama pull {}";
      vi = "nvim";
      vim = "nvim";
      wmoff = "launchctl unload ~/Library/LaunchAgents/org.nixos.yabai.plist";
      wmon = "launchctl load ~/Library/LaunchAgents/org.nixos.yabai.plist";
      wmre = "wmoff && wmon";
      preview = "qlmanage -p $1";
    };
    extraInit = ''
      cat /dev/null > /var/mail/${current.user}
      eval $(${pkgs.thefuck}/bin/thefuck --alias fuck)
      unset MAILCHECK
    '';
    interactiveShellInit = ''
      clear
    '';
    variables = {
      EDITOR = "nvim";
      LANG = "en_US.UTF-8";
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      PAGER = "less";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE =
        "fg=${conf.style.theme.extra.purple},bg=none";
      pathsToLink = [
        "$HOME/.cargo/bin"
        "/Applications"
        "/nix/var/nix/profiles/default/bin/"
        "/share/zsh"
        "/usr/local/texlive/2023/bin/universal-darwin/"
      ];
    };
  };
}
