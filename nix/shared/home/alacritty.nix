{ pkgs, unstable, ... }:
let conf = import ../../../config.nix;
in {
  programs.alacritty = {
    package = unstable.alacritty;
    enable = true;
    settings = {
      decorations = "none";
      opacity = 0.95;
      startup_mode = "Windowed";
      title = "Term";
      dynamic_title = true;
      option_as_alt = "None";
      scrolling.history = 10000;
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
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = [ "-l" ];
      };
      font = {
        normal = {
          family = "${conf.style.font}";
          style = "Regular";
        };
        bold = {
          family = "${conf.style.font}";
          style = "Regular";
        };
        italic = {
          family = "${conf.style.font}";
          style = "Regular";
        };
        bold_italic = {
          family = "${conf.style.font}";
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
        inherit (conf.style.theme) primary;
        style.shape = "Beam";
      };
      draw_bold_text_with_bright_colors = false;
      colors = {
        inherit (conf.style.theme) primary normal bright;
        footer_bar = {
          foreground = "${conf.style.theme.normal.black}";
          background = "${conf.style.theme.normal.red}";
        };
        search = {
          matches = {
            foreground = "${conf.style.theme.extra.orange}";
            background = "${conf.style.theme.normal.black}";
          };
          focused_match = {
            foreground = "${conf.style.theme.normal.red}";
            background = "${conf.style.theme.normal.black}";
          };
        };
      };
    };
  };
}
