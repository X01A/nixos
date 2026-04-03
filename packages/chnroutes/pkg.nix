{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3590734414f986c10aadefbb441efd1f132be853";
    sha256 = "sha256-cpyLZJqfVBderM20VA27scaW8KidEFE29g4/mi9h17U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
