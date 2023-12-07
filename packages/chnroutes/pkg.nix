{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "274a65328ab4c51acf6e65cab16e05dc8c85b4d2";
    sha256 = "sha256-qZalskV3JwHI21FpXPzqYDzvQ1zPdCs8pLYfqSIkwFI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
