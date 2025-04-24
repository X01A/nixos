{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aa256d17cec26192123e8de517c355f14770c48a";
    sha256 = "sha256-qP7jFuwd74Cs0tCiN8M/c0Cjhs7eAtLwI1MMlXUpuLU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
