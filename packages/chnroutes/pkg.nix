{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e93bfc346c17c77c395528c6acf464091ffda199";
    sha256 = "sha256-6jzaVfiquRqZOHuF9M7wOrg1qr2o5vuH8NMTO2/Fsz4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
