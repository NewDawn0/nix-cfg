{ current, ... }:
let conf = import ./../../config.nix;
in {
  nix = {
    checkConfig = true;
    distributedBuilds = true;
    buildMachines = [{
      hostName = "eu.nixbuild.net";
      system = "x86_64-linux";
      maxJobs = 100;
      supportedFeatures = [ "benchmark" "big-parallel" ];
    }];
    settings = {
      auto-optimise-store = true;
      bash-prompt-prefix = "(nix:$name)\\040";
      extra-nix-path = "nixpkgs=flake:nixpkgs";
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "${current.user}" "root" "@wheel" "@admin" ];
      extra-sandbox-paths = [ "/private/tmp/" "/usr/bin/env" ];
      sandbox = false;
      sandbox-fallback = false;
    };
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
  };
}
