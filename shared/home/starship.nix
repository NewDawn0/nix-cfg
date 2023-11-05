{ pkgs, ... }:
let
  cols = {
    red = "#ff5868";
    orange = "#ffa500";
    green = "#a6da95";
  };
  conf = import ../../conf.nix;
in {
  programs.starship = {
    enable = conf.home-mods.starship;
    settings = {
      add_newline = false;
      command_timeout = 2000;
      format = "$character";
      right_format = "$cmd_duration";
      character = {
        success_symbol = "[ ](${cols.orange})";
        error_symbol = "[ ](${cols.red})";
        vimcmd_symbol = "[ ](${cols.green})";
        disabled = false;
      };
      cmd_duration = {
        min_time = 1;
        format = "[ $duration ](${cols.orange})";
        disabled = false;
      };
      directory = {
        format = "[ $path](${cols.orange})";
        truncation_length = 3;
        truncate_to_repo = false;
        disabled = false;
      };
      # Disabled modules
      docker_context.disabled = true;
      git_branch.disabled = true;
      git_status.disabled = true;
      git_commit.disabled = true;
      git_state.disabled = true;
      hostname.disabled = true;
      username.disabled = true;
      battery.disabled = true;
      time.disabled = true;
      # Langs & Frameworks
    };
  };
}
