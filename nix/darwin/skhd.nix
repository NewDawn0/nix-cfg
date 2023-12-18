{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ skhd ];
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # Term
      cmd - return : open -a alacritty
      lalt - return : open -a Orion

      # Rotate
      alt -r : yabai -m space --rotate 90

      # Full screen
      alt - f : yabai -m window --toggle zoom-fullscreen

      # Float / unfloat
      ctrl - f : yabai -m window --toggle float

      # Resize win
      ctrl + alt - h : \
          yabai -m window --resize left:-50:0 ; \
          yabai -m window --resize right:-50:0

      ctrl + alt - j : \
          yabai -m window --resize bottom:0:50 ; \
          yabai -m window --resize top:0:50

      ctrl + alt - k : \
          yabai -m window --resize bottom:0:-50 ; \
          yabai -m window --resize top:0:-50

      ctrl + alt - l : \
          yabai -m window --resize right:50:0 ; \
          yabai -m window --resize left:50:0

      # Move win
      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east

      # Focus win
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # Mirror space
      ctrl + alt - x : yabai -m space --mirror x-axis
      ctrl + alt - y : yabai -m space --mirror y-axis

      # Restart yabai
      shift + alt - r : launchctl unload ~/Library/LaunchAgents/org.nixos.yabai.plist \
          && launchctl load ~/Library/LaunchAgents/org.nixos.yabai.plist
    '';
  };
}
