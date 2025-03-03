{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "12c306304b055dbfa07efbd390f6d203930a908b";
    sha256 = "sha256-B7e7nw1nDx4Rol+U0HbIYODGdAn8f73/PkbLJAMwx48=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
