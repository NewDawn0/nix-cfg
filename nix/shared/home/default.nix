{ current, inputs, pkgs, unstable, ... }:
let conf = import ./../../../config.nix;
in {
  backupFileExtension = "bak";
  extraSpecialArgs = { inherit inputs unstable; };
  useGlobalPkgs = true;
  useUserPackages = true;
  users.${current.user}.imports = [
    ({ pkgs, unstable, ... }: {
      manual = { manpages.enable = false; };
      home = {
        inherit (conf) stateVersion;
        enableNixpkgsReleaseCheck = false;
      };
      programs = {
        command-not-found.enable = false;
        gitui.enable = true;
        home-manager.enable = true;
      };
      imports = [
        ./alacritty.nix
        ./amethyst.nix
        ./bash.nix
        ./bat.nix
        ./btm.nix
        ./direnv.nix
        ./eza.nix
        ./firefox.nix
        ./gh.nix
        ./git.nix
        ./nu.nix
        ./starship.nix
        ./vscode.nix
        ./zsh.nix
      ];
    })
  ];
}
