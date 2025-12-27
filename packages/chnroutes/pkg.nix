{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2025-12-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "93c57ab7d7dde7be8d8057a1c35906aa79a1263a";
    sha256 = "sha256-RDR+btP895E9K9+WTp2A+MVNnCeu+Z1kwzaxSQo/uwc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
