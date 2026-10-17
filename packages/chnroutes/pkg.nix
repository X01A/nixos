{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "550e09b12e97a4a63ccea1a49595b36c2634617c";
    sha256 = "sha256-1ZQ57dhPCLcK+1oqAisxPqiml+z62bvpP6/07Da4cww=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
