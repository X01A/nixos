{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "68c283734beb8511741cd5b355a32a98a5266cb6";
    sha256 = "sha256-nTb2O0LRWbeJTY8fueUAarCpJBIBokay44Uw99UmpDY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
