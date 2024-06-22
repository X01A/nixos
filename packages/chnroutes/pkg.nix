{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c66e191c0b409737edf32ba5390a5c78a3bd4d41";
    sha256 = "sha256-RjDcFDZU019eLEv8jGsX4TOo/6jubNLqFHr6DV4sQSA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
