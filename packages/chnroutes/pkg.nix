{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "934b52a51119f0579a390215bc420339baf66062";
    sha256 = "sha256-rm0AsMhwing8+Bz2NzcoAOBZ7fusK8GPupspj3N1ShE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
