{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cfc08f250cd1b682d3e8631928557672645f72f0";
    sha256 = "sha256-2He2b064M4NnF1JCDnP2EtyCG3T1tW0qp1Yy9GSchIg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
