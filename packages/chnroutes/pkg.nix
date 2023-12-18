{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8d677ec49d8a4d891ea1682008504fb272eebb5f";
    sha256 = "sha256-xqoMNNB8cCP/qH6bX2pRJCnW10sIXDTw3Yj1FsX1cPg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
