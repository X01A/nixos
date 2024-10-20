{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f2e00743a0e0ca47af3e8200e09df9e611ea20f6";
    sha256 = "sha256-jelcgrgZ1zs5YaN3vQ0WsN9sD6MXZ7jFwI+Vw8adWVI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
