{ pkgs, ... }:
let conf = import ../../conf.nix;
in {
  programs.nushell = {
    enable = conf.home-mods.nushell;
    configFile.text = ''
      let $config = {
        show_banner: false
        filesize_metric: false
        table_mode: rounded
        use_ls_colors: true
      }
    '';
  };
}
