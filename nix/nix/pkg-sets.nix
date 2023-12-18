{ inputs, ... }:
let
  conf = import ./../../config.nix;
  overlays = import ./../shared/overlays.nix { inherit inputs; };
  config = { allowUnfree = true; };
in {
  forEachSystem = f:
    inputs.nixpkgs.lib.genAttrs conf.systems (system:
      f {
        pkgs = import inputs.nix { inherit config overlays system; };
        unstable =
          import inputs.nix-unstable { inherit config overlays system; };
      });
  sets = system: {
    pkgs = import inputs.nix { inherit config overlays system; };
    unstable = import inputs.nix-unstable { inherit config overlays system; };
  };
}
