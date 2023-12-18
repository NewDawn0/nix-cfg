{ pkgs ? import <nixpkgs> { } }:
with pkgs;
tmuxPlugins.mkTmuxPlugin {
  pluginName = "everblush";
  version = "0.1.0";
  src = pkgs.fetchurl {
    url =
      "https://github.com/NewDawn0/everblush-tmux/archive/refs/tags/Release.tar.gz";
    sha256 = "sha256-7ks5qeDM6Sy7L9wDTSJ14/FeLzjDXv9y+VGg6w6G+hc=";
  };
  meta = with lib; {
    description = "Everblush tmux theme";
    homepage = "https://github.com/NewDawn0/everblush-tmux";
    maintainers = with maintainers; [ "NewDawn0" ];
    license = licenses.mit;
  };
}
