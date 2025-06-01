{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "717397443a8671cc9408c1a960102a3987754ccf";
    sha256 = "sha256-hu8ztQkAv5c5sKhg6cOOFeVT8+4lH5YvJ0xI3ysH67Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
