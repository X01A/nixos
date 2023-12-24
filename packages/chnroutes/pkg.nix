{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8c154b402eb65e1ed61c1343cbbefd35115bcd3a";
    sha256 = "sha256-TtvyCCFkfs28PZ4bYZ1XEr++oZD/EoKSsCxnPHgqt6I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
