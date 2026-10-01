{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "59de976808defb64b632ca721906d41b305bb279";
    sha256 = "sha256-KQaTrrZvtLOUEbDxAjrAsyQ6kFvfbrfkjCe700rxZPk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
