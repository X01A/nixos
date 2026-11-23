{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a6036b3bf7db442811a4a3158d605bb1b6ce4818";
    sha256 = "sha256-09SCG7Vt62OIMUfuC4/u7hwzv1+DY5+AT7jgnWTr13g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
