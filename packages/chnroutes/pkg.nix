{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a4dcfb099049adb14ba9d56205c15b76f0877318";
    sha256 = "sha256-0mBDbS/P++ePcmXfTDxMrSDMlzklcnx5/iduoOnTO4c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
