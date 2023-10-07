let cols = import ./colours.nix;
in {
  user = "tom";
  home = "/Users/tom";
  hostname = "t-book-pro";
  system = "x86_64-darwin";
  pic-dir = "$HOME/Pictures";
  nix-conf-dir = "$HOME/.nix-cfg";
  gitUser = "NewDawn0";
  gitMail = "aci.v.i.iv@gmail.com";
  theme = cols.themes.everblush;
}
