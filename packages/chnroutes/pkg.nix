{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "34769bf731111f309856fead7eadeaaa1a26a98a";
    sha256 = "sha256-mOJ+DWBF1ITdbmJtk6C/qHr+CcEaXmIGUk5ArfzCWnE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
