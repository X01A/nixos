{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3a13d7a6fea071f58fef55cdb6bd2432f41f90ac";
    sha256 = "sha256-CtjzhLpBkS/SdvUXMvW4rlc1MAcz6KAwrVC7FJ6Fyrg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
