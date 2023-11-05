let cols = import ./shared/colours.nix;
in {
  user = "tom";
  hostname = "T-BookPro";
  gitUser = "NewDawn0";
  gitMail = "aci.v.i.iv@gmail.com";
  nix-conf-dir = "$HOME/.nix-cfg";
  darwin = {
    system = "x86_64-darwin";
    pic-dir = "$HOME/Pictures/";
  };
  nix = { };
  theme = cols.themes.everblush;
  font = "FiraCode Nerd Font";
  home-mods = {
    alacritty = true;
    bat = true;
    bash = false;
    bottom = true;
    direnv = true;
    eza = true;
    firefox = false;
    git = true;
    nushell = false;
    starship = true;
    tmux = true;
    vscode = true;
    zsh = true;
  };
}
