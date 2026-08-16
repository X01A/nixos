{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3ec3f6a84b2e55d1715c448ee4461256e37bf192";
    sha256 = "sha256-sbrj8xy5I70IY8EnNjVIUSUCH/9yv/XbWwFe+jKBF4w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
