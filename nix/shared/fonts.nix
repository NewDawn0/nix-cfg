{ pkgs, ... }: {
  fontDir.enable = true;
  fonts = with pkgs; [
    font-awesome
    (nerdfonts.override {
      fonts = [
        "DroidSansMono"
        "FiraCode"
        "Hack"
        "Hermit"
        "Iosevka"
        "JetBrainsMono"
        "Meslo"
        "VictorMono"
      ];
    })
  ];
}
