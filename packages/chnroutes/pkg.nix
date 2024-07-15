{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "697860f782cc9f0444461df6807d0e4e3376bf1e";
    sha256 = "sha256-rgnZSX03nayZtTU6aV4fDjuSkWToTruqFQEItcBRS00=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
