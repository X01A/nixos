{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d964e1ba839763c17a9aaf618403d8c7bc7e3639";
    sha256 = "sha256-ku8mdHUPihoheIxymLXBPSup60fk//NNJKPTzzpZBOg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
