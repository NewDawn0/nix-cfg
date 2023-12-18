{
  programs.nushell = {
    enable = true;
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
