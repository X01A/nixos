{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7887e9ff6189db4c72e05a8adaa8ecb1f743a46c";
    sha256 = "sha256-GM0IAq8xxIAi9FNrygZkcmwuK6O1hf26B+dIlXKWKoM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
