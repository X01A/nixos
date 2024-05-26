{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ced7589a4dde42c01f13a60e106077427d2be65a";
    sha256 = "sha256-ol1wjmpc3IqIl/hel3xW1StFc70GchlqaSM5++jC4J0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
