{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a051f238fa4e958c00861b4e211fa68dafef0005";
    sha256 = "sha256-PX8C0HOO9Oezgj8iPNL2aEMK7HjMlJqENlKNyftYQBM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
