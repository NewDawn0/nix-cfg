{ pkgs ? import <nixpkgs> { } }:
with pkgs;
buildGoModule rec {
  name = "note";
  src = ./.;
  vendorHash = "sha256-kzMvksDjhqKlHvBwl0spOApFKHKM7lm0WG2hifP6+Ro=";
  meta = with lib; {
    description = "note - A temporary scratch buffer";
    maintainers = with maintainers; [ NewDawn0 ];
    license = licenses.mit;
  };
}
