{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ed8bc574bbfb591a26c0a2c30953c3adfce4d8a2";
    sha256 = "sha256-tSGy/URoQhdLxNF+P8AQy1i10wjVLoy8GHkBgfY1kVI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
