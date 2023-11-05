{ pkgs, ... }:
let conf = import ../../conf.nix;
in {
  programs.bottom = {
    enable = conf.home-mods.bottom;
    package = pkgs.bottom;
    settings.flags = {
      rate = "1s";
      hide_time = true;
      hide_table_gap = false;
      battery = true;
      enable_gpu_memory = true;
      avg_cpu = true;
      temperature_type = "c";
      colors = { low_battery_color = "red"; };
    };
  };
}
