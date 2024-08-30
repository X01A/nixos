{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f28214f741b321e276ee1cc832cee66f4495ca1e";
    sha256 = "sha256-a6J+dPT10fDlpSk1Y3299Fisyyszjv0KZ0fB3tCwPmk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
