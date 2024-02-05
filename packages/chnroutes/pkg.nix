{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "99f645d382f07f5de3d27eeb4f5aabac59a3a1fe";
    sha256 = "sha256-fWYqeyMvBhiQU+nk8wrZHCxwvG7XYyDlPpDd/6agnCQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
