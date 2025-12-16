{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6b756596e5631422afd9b5797ad81f9188dd8281";
    sha256 = "sha256-bY+482Abnd+Srln5c59lM2liZdiwDJQLkreB0djg73Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
