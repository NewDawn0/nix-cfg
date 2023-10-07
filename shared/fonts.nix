{ pkgs, ... }: {
  fontDir.enable = true;
  fonts = with pkgs; [
    font-awesome
    sf-mono-liga-bin
    (nerdfonts.override {
      fonts = [
        "Meslo"
        "FiraCode"
        "Hermit"
        "Iosevka"
        "Hack"
        "JetBrainsMono"
        "DroidSansMono"
        "VictorMono"
      ];
    })
  ];
}
