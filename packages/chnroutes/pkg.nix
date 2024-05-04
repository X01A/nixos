{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "32461198e8926347ed3986e8d413e504268da52f";
    sha256 = "sha256-vHozO0hsUytjpajXrdbAoL1+I+kskkExOSj7fiVfsig=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
