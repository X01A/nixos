{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1943f76aef366e0eae8842f42566fdd2ac76d1a5";
    sha256 = "sha256-pNhHpkMawu1Z6LqCm04yxUz8MttJZwQf35vvREMiN1E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
