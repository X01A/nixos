{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "83de1b475dc5a31ebe704ba1ae934219de9b3325";
    sha256 = "sha256-pZKl3pFHvl1i6BZDAPnAO07+i1zZhWKNxRj1yQWs4y0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
