{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "65e55d53dd99fec877bddc93ba764b19efae60fe";
    sha256 = "sha256-R2WgAVh3lgQU6n8w3NhZTKHjS0ds4jmo0RFAjr358jk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
