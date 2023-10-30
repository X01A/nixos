{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-10-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4a70b74e1c64b62fdb65d56556769692f8e65ade";
    sha256 = "sha256-d03PMqqWvzJwA+ALdt1RlZwRLQf3vfAEuHnydAcPagY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
