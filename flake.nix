{
  description = "NewDawn0's darwin system configuration";
  inputs = {
    nix.url = "github:nixos/nixpkgs/nixos-23.11";
    nix-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nix";
    };
    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nix";
    };
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };
    fh = {
      url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
      inputs.nixpkgs.follows = "nix";
    };
  };
  outputs = { self, nix, nix-unstable, ... }@inputs:
    let
      conf = import ./config.nix;
      pkg-sets = import ./nix/nix/pkg-sets.nix { inherit inputs; };
      mkSysAttrs = current:
        let sets = pkg-sets.sets current.arch;
        in {
          system = current.arch;
          inherit (sets) pkgs unstable;
          inherit current;
          specialArgs = {
            inherit (sets) unstable;
            inherit current inputs;
          };
          home-manager = import ./nix/shared/home {
            inherit inputs current;
            inherit (sets) pkgs unstable;
          };
          users.users.${current.user} = {
            home = "${current.homePrefix}" + "${current.user}";
            inherit (current) description;
            name = current.user;
            isHidden = false;
            shell = pkg-sets.pkgs.zsh;
          };
        };
    in {
      nixosConfigurations = { };
      darwinConfigurations = {
        NewDawn0 = let
          inherit (mkSysAttrs conf.systems.NewDawn0)
            system specialArgs pkgs home-manager users;
        in inputs.darwin.lib.darwinSystem {
          inherit system specialArgs pkgs;
          modules = [
            ./nix/shared
            ./nix/darwin
            inputs.home.darwinModules.home-manager
            { inherit home-manager users; }
          ];
        };
      };
    };
}
