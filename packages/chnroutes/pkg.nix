{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b6993aef5a9375f57584ee74f4469543d6ad5d99";
    sha256 = "sha256-8UDYn6KnmsMQdVtDv5G/QPMoW441oduBPHIav1ORNgw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
