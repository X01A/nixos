{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "fb75c015e801187fef2cf5f27028a06f56c0279b";
    sha256 = "sha256-6iNcLx3WsPz3mwoKWBh1junUDajAgdpCvm/GVc+hk7Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
