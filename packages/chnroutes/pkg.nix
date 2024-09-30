{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "980a5eb0b692e9bdbfeb8583cecc8d32b116fb89";
    sha256 = "sha256-UVqdMnuFvQEPZ3rjaloT3v1tHsKGZH6vdhat0QK4OWQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
