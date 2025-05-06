{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "25fa076ccef4d64006c9d3486572c16038756bd6";
    sha256 = "sha256-wzp0RzQgnD27U+vHdGh8Q/58ZWBzBET2kNx9RkOp/T0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
