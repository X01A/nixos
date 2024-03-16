{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8ff13f86b0cb33ee88dbe3d66c477d9306672537";
    sha256 = "sha256-5VcXSoOzMU1F7DHNDngTZv4fs+wLwzIYJX/BbwPgm2Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
