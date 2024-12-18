{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ef2e7e0cd5a7c170762d08ce9a34dbd9836c8495";
    sha256 = "sha256-NqmofEshpFe5rBC9FweHVP+WzG07cRTwCqhm5IBffFI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
