{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d155625d4a5eb1e0365c4ea29111e753df189b8d";
    sha256 = "sha256-8YtGKbNwco70piWyht4VZyo524/UcwPsEPMzQZVRhns=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
