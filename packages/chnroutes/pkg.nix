{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ce4853a11d14cf0b06efd647fd670aa195b66f4a";
    sha256 = "sha256-FDkPGOUeHxUlF2GocTcdxvhTO1T8Wv1W6BVzv8+MmEE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
