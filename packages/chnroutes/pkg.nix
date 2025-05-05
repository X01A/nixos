{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "455a74abdb66e62b34a21542e8ea9a47de540338";
    sha256 = "sha256-afzfADIrk0nFCBzgbIn7ueNgCk+9AAn6myIK2G4H9+U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
