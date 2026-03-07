{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c32a3fbb18ec8b6da46b1c902cc4fac19f8b219b";
    sha256 = "sha256-jDhDlhxC5n4GJc4pQFef172SppwCJOFAt5dvhO3FirA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
