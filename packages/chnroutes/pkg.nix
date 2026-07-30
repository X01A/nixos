{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "504db648fb21ac114896ce4f6449b8299ae35568";
    sha256 = "sha256-+boaxOcEQCsRf4yUR3H+2ZOwMqhP73HQXBRJdhfl4c0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
