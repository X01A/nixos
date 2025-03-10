{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5a929a46d0c9dfed4824ff7e5704a4900d9b6f16";
    sha256 = "sha256-lXql/UZT0MnBHdxgdfDBsK2f2bvUcmIMJSXL7LHb24E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
