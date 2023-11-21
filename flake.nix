{
  description = "NewDawn0's darwin system configuration";
  inputs = {
    #### Package sources ####
    # -> Nix packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # -> Nix darwin
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    # -> Nix user repo
    nur.url = "github:nix-community/NUR";
    # -> Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # Overlays
    sf-mono-liga-src.url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
    sf-mono-liga-src.flake = false;
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  outputs =
    { self, nixpkgs, darwin, home-manager, nur, rust-overlay, ... }@inputs:
    let
      conf = import ./conf.nix;
      pkgs = import nixpkgs { # cfg nixpkgs
        inherit (conf.darwin) system;
        config = {
          allowUnfree = true;
          substitute = true;
        };
        overlays =
          import ./shared/overlays.nix { inherit inputs rust-overlay nur; };
      };
    in {
      darwinConfigurations."${conf.hostname}" = darwin.lib.darwinSystem {
        inherit (conf.darwin) system;
        inherit pkgs;
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = import ./shared/home { inherit pkgs; };
            users.users.tom = {
              home = "/Users/tom";
              description = "NewDawn0 (Tom)";
              name = "tom";
              isHidden = false;
              shell = pkgs.zsh;
            };
          }
        ];
      };
    };
}
