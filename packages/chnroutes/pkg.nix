{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f7aa592a1ff88fc7e0ed8b83f66cb9c7c359b0d1";
    sha256 = "sha256-eoVtO4QW92K/LKprQDzcb9dbYQplsStPifP83tVWnOA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
