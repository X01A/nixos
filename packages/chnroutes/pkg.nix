{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4a6822495e104bc3dbb7f07f4863e64ce901aa59";
    sha256 = "sha256-G5dQol/q0K7Vti69Zse71uhdnAgftpWl33m+2dxKVSY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
