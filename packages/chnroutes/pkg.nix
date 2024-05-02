{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0cf79cb3d22f344ffb78895742bf793036542f61";
    sha256 = "sha256-KTcJQpST/DJx24qF42LHFUSdONOxl3BKbQwe/wq0pk4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
