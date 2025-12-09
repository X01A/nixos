{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f2369fd49ba821a1fd8f926aad9470f8119f238d";
    sha256 = "sha256-Y2Rd+ntq0m8PIDHwfQ0QHRjohc6RcHn9eH2ZvOAA4PA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
