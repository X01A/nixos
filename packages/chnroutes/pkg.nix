{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2259fc5e2ea3b44bd2b1a0881cb375958b36c08a";
    sha256 = "sha256-fkOXDc2z5CarqKcGm1xB4Ly1FGTAenpJT8KfWquPYLo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
