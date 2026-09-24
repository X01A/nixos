{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "eea054033c63f5079331c7071463086e50b14696";
    sha256 = "sha256-wLG6cptbWLvdy31+BZV6UEedCD+zUa2OP6bBJ9wJW/0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
