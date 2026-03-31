{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "06223fdfd1c80f77dacffb131b2c3915236d245e";
    sha256 = "sha256-lXjZeb3amt38kCqv4QmLSSsFWWZ2QA6FQ9+UlA1pet0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
