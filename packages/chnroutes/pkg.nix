{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "35a329014260bd504844119ed343851f5e62dc45";
    sha256 = "sha256-oQ5pEqZd11W/E+Gmmt20obMQKLgJEIPh73+wGf+l7Bk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
