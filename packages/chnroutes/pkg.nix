{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "fc3cb134e57c3e10b88179d017a7296135ae6a3c";
    sha256 = "sha256-sXWgAnwoTQzwXT0iJdudrrAt15ZrZ239FYkVrXrPxCE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
