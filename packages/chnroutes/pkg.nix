{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "99e980387fb18ce10f12c4f2ba9fdc7d4d0559aa";
    sha256 = "sha256-Ve646M8RpEyYOJ6rC+A6U0i5LG+rIgcvXAjUcUXR8eQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
