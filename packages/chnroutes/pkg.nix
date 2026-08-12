{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "11ba1147ada98e56a04a06ff57324661f71f1877";
    sha256 = "sha256-puy2ncyL7BYGHcIMkg8+hPDRYl9vq2Nh5MMyuvThIZQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
