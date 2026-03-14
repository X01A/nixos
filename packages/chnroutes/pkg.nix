{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d805a7190f33b6e0771d5d01a67b7cd8cd657add";
    sha256 = "sha256-d+3X9dJmNTh0E3WMeQ6NhIkBeBDZX5a2qcFqaJ3Aim4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
