{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cb06ecf1854eccdbce99f0b93166002259cb0df1";
    sha256 = "sha256-L1eOBBA0S+b3Pe6nx2LNRSZTACCOuMMQEgwdKvxYZTQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
