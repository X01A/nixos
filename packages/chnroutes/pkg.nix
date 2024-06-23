{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "07fb9845ceb8a78e31b5c5690465eee69bc54501";
    sha256 = "sha256-UEAnrdAhu5J7OVtV8RIFFj9NaOt1uhBzwYmIheLCKt4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
