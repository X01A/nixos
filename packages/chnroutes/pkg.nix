{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "658464d3a7ee6d8771e3fd6ec26346f788d6e278";
    sha256 = "sha256-3vPQRv36ZFlc40PJrnLmgQhHY3CU5qpfZp84cJIxmyw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
