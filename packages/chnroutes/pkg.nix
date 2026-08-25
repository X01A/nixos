{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "41a6ebc8ecc186769545d832f1ae8879f42ce42a";
    sha256 = "sha256-RRmDzYxQFhHtFeW7MJJVRrrwe2KCynvRum1xK53kgxc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
