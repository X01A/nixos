{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "91d2f5ccea7708aa9b0e5bced4f0ad4b3bb7f807";
    sha256 = "sha256-87/mA1Hwg7uilywfgCw0LMej17WhZYMfYRzkczk9j+w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
