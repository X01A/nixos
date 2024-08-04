{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7461d87095fb53b9a43dd3d734c9a65e34c4402f";
    sha256 = "sha256-wJo7EUMrk0mS9iAcU6Y1yIRIEkUrejvip8SeiKReM+A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
