{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "75ed579f78549728cceb95beab4f3d6248af8aff";
    sha256 = "sha256-b6Kl6GBtNhSxNAaGirzVY29RuLY79CWZq5YhXSm+Mjo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
