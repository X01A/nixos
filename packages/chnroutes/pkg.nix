{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "422d6660eea1b8879813fefe3391ba4474e0a70b";
    sha256 = "sha256-DHAV9DLoBzYsVMihAoqb3ql4cJPEo7I9lsTsxuRO+nw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
