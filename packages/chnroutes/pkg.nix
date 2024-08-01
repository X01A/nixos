{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bf3ef9c500ec9c41ee11565189ba4eda74d4faa7";
    sha256 = "sha256-ArlPr7LUneQe4so6LsnEMBFFuzcBpKYxRMmPdc85sWk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
