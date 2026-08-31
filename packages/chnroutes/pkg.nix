{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c7728828c6254c6be0cd773775624db41a778f8b";
    sha256 = "sha256-rN+P/I28VixqyTIVOFJ0bBrQEwJNX8i0crQnc/i8zbY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
