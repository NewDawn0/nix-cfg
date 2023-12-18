let
  themes = import ./nix/shared/themes.nix;
  git = {
    user = "NewDawn0";
    mail = "aci.v.i.iv@gmail.com";
  };
  nix-dir = "$HOME/nixcfg/";
  stateVersion = "24.05";
  style = {
    font = "FiraCode Nerd Font";
    theme = themes.everblush;
  };
  systems = {
    NewDawn0 = {
      arch = "x86_64-darwin";
      description = "NewDawn0 (Tom)";
      homePrefix = "/Users/";
      hostname = "NewDawn0";
      user = "tom";
    };
  };
  caches = {
    nixos-org = {
      cache = "https://cache.nixos.org";
      publicKey =
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
    };
    nix-community = {
      cache = "https://nix-community.cachix.org";
      publicKey =
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
    };
  };
in { inherit systems stateVersion caches style nix-dir git; }
