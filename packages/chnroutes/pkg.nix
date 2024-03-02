{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "58c66f64e776327cbafdb94ef84f3f3c88b2670e";
    sha256 = "sha256-jpfa4EYx/Epyrv+0tMtCqHHkE577plWbPq0MjIQT9fo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
