{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "079c27f86f461b80f1994b4760c120398bd646a6";
    sha256 = "sha256-iRd49xYPmlloqnW9sLYGC2D/xeoVbRq8SRi3gRw1E9I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
