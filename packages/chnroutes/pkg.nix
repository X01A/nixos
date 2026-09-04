{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "317c3f4b8e1f6184e355ed3e22c3d1605453237e";
    sha256 = "sha256-cv9ulGcL4W1Jc+ssp4+Pr6ogFUa+VBKjRLxXy4gncMM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
