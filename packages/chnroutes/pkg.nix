{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f2d76776f826ef1ac6d71639388c9dccad672ddb";
    sha256 = "sha256-dWnDsQbli6MKPuFk4PRASWlvhKtZehPzPXZ82FNd6Jw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
