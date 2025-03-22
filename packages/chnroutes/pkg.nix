{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "42865fdf0ef07f56996acf9ea46b5ebf3dacb81f";
    sha256 = "sha256-bg/TGXRECMb0Z0EIo5xuI57lA0X/vfhVWel2rFh1ics=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
