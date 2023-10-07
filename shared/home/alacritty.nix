{ pkgs, ... }:
let
  conf = import ../conf.nix;
  font = "FiraCode Nerd Font";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        dimensions = {
          lines = 24;
          columns = 80;
        };
        padding = {
          x = 0;
          y = 0;
        };
        decorations = "none";
        opacity = 0.95;
        startup_mode = "Windowed";
        title = "Term";
        dynamic_title = true;
        option_as_alt = "None";
      };
      scrolling.history = 10000;
      working_directory = "\${home}"; # Not working
      font = {
        normal = {
          family = "${font}";
          style = "Regular";
        };
        bold = {
          family = "${font}";
          style = "Regular";
        };
        italic = {
          family = "${font}";
          style = "Regular";
        };
        bold_italic = {
          family = "${font}";
          style = "Regular";
        };
        size = 12.0;
        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
        builtin_box_drawing = false;
      };
      cursor = {
        inherit (conf.theme) primary;
        style.shape = "Beam";
      };
      draw_bold_text_with_bright_colors = false;
      colors = {
        inherit (conf.theme) primary normal bright;
        footer_bar = {
          foreground = "${conf.theme.normal.black}";
          background = "${conf.theme.normal.red}";
        };
        search = {
          matches = {
            foreground = "${conf.theme.extra.orange}";
            background = "${conf.theme.normal.black}";
          };
          focused_match = {
            foreground = "${conf.theme.normal.red}";
            background = "${conf.theme.normal.black}";
          };
        };
      };
    };
  };
}
