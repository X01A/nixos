{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "db515368e0ec37bb214b71a9737ed9486d004697";
    sha256 = "sha256-Vm/wMUbF3pMHNRDLOB7RXuKOik0s3l0kO8ktBUAffpE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
