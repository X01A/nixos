{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8567300a17214da24d9b0d30fb14cf6d0a461300";
    sha256 = "sha256-K4c106JWd0A7xyHcZqnK8PYUbnjo9GIizmCaY2TlLdQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
