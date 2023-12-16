{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "26dab8de39525a2b22d7b7de82065e1803a9246e";
    sha256 = "sha256-+CP5VzqwTyGln3BbpR3zmpH0OCjHj/znNXRkB5/gVwA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
