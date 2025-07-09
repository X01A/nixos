{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a0bc985eb854f00122720de5cb367f3d86fd9e5f";
    sha256 = "sha256-DAsrxjVpdkpOuSoRFukrWnHBG3SI9h1P3gSD5rHwKQs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
