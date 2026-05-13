{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "10b50684521eb31b320f16e902ebd441097e6a41";
    sha256 = "sha256-A2GbogB7LjovOIVNAj/z0Q3El/RCA/zUazMl88Drqi0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
