{ pkgs, ... }:
let conf = import ./conf.nix;
in {
  # Nix config
  nix = {
    # Package config
    package = pkgs.nix;
    # User setup 
    settings = {
      trusted-users = [ "${conf.user}" "root" "@wheel" "@admin" ];
      auto-optimise-store = true;
      extra-sandbox-paths = [ "/private/tmp/" "/usr/bin/env" ];
      sandbox = false;
    };
    # Garbage collection
    gc = {
      user = "root";
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };

    # Turn this on to make command line easier
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
