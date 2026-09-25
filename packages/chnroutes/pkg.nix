{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "24bf5b094d0806cd73ea889e0b37f49e1062dcdf";
    sha256 = "sha256-K1gsCRKdrTyg+vYKW/3ukTlzEodeRe0licOxNXRUVRM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
