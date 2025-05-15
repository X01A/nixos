{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2eb94cb11cadc9eddba7c9db4d5094c82fafa6f7";
    sha256 = "sha256-UjIs7TYefsxMQ8cdCiKYVorZesDxSvjyMOzMrFHwXsQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
