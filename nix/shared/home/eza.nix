{ unstable, ... }: {
  programs.eza = {
    enable = true;
    package = unstable.eza;
    git = true;
    icons = true;
  };
}
