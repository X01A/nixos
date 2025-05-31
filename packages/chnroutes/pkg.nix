{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ced0342970d4bc39193b699a35904cbc3920ee4a";
    sha256 = "sha256-ao6c7Pqf8+jtIcsj0D5/mLKW3C02++8h5PdlNk3OAlM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
