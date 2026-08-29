{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d99de8bb32527dbe26c6476e0894f7444d97e5f8";
    sha256 = "sha256-qkYOQClEockwFPIU5Hi00B8s5zFav1EofLo9sIIXGcM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
