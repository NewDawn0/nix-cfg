{ pkgs, ... }: {
  enable = true;
  package = pkgs.yabai;
  config = {
    # Layout
    layout = "bsp";
    auto_balance = "off";
    split_ratio = 0.5;
    # Gap
    top_padding = 10;
    bottom_padding = 10;
    left_padding = 10;
    right_padding = 10;
    window_gap = 10;
    # Border & Gaps
    window_border = "off";
    active_window_border_topmost = "on";
    window_border_width = 2;
    active_window_border_color = "0xffff3050";
    normal_window_border_color = "0xffaaaaaa";
    # Mouse
    mouse_action1 = "resize";
    mouse_action2 = "move";
    mouse_drop_action = "swap";
    mouse_modifier = "fn";
    mouse_follows_focus = "off";
    focus_follows_mouse = "off";
    # Window
    active_window_opacity = 1.0;
    normal_window_opacity = 0.9;
    window_placement = "second_child";
    window_topmost = "on";
    window_shadow = "on";
    window_opacity = "on";
  };
  extraConfig = ''
    # Unload macOS WM
    launchctl unload -F /System/Library/LaunchAgents/com.apple.WindowManager.plist > /dev/null 2>&1 &
    # Rules
    yabai -m rule --add app="^Microsoft Outlook$" manage=on
    yabai -m rule --add app="^(Raycast|Font Book|Calculator|Software Update|Dictionary|System Preferences|zoom.us|Archive Utility|Python|App Store|Activity Monitor)$" manage=off layer=above
    yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
    yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
    yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
  '';
}
