{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "fa8e53b8251d199dfe53fda24f5f2726f91486ba";
    sha256 = "sha256-ogH9d5YzrVA5QOOs73EhbASi658hMAfZlKndYdc0p6Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
