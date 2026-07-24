{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a4ed4eeffc37fb837e2ee50afa1fbdd3fd921bbc";
    sha256 = "sha256-+Fa4IyNvL3Zol7VgXR6PYnWCxT/9a1fsE6+0/Iw25MU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
