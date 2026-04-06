{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ba535301cf53f5a7232bfaf1bbcfdd1a589ce7d9";
    sha256 = "sha256-F5xpuMOcUNydHaEgFFz8EZWlXo5c2oGq8hdeGZKChVQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
