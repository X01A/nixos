{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2a460236bc5cd187c18427bac20299d69c6d1298";
    sha256 = "sha256-YlIJUD9VF9JYBf0hIUavMROAOLPOeuqoAITw1ElWApE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
