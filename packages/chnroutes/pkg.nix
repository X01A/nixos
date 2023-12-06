{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a18378dd975b1411690d1652145952100c283e74";
    sha256 = "sha256-QSARGVseM7kEkwJkID7gUctK34vYjXvUd2jgUuataO4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
