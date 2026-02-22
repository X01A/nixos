{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d7d03450bdf827d4f1312524bee91d7f95a71bf0";
    sha256 = "sha256-X6t5LQgpge057k+PLMYJIShLjrMke0uaESJ9pJJC2FY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
