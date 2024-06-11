{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "78713a47dcdcd68b57b7fbfa74b1bdbe495f7870";
    sha256 = "sha256-IZOwsDrzTMlixJxVRf/X6TZsPvBTNS98cz3qKph1PVc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
