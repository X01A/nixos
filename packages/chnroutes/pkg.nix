{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9c7661e99a025ebd4906a6a3ae2acafaa7e914fb";
    sha256 = "sha256-pnMlmnyqNFuCQiYwCG+bgTHID1925LYtUHcdoTMwjVw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
