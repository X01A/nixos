{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0158c611a75cf3c067c7385f7f50920ac5921f15";
    sha256 = "sha256-qlIDwS2km/k1fjR8yFnUT2el6e7L/8r83mK0DTofZQI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
