{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9c608f5a5158521d630ac689183e1260712c941e";
    sha256 = "sha256-FKcynSyBnX/f1p2vlzSSul0fdD2ZCn6+PlnOXPQmjJw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
