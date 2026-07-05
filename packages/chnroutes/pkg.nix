{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "5c672309c922e2a23a11d088317a6f81547d258c";
    sha256 = "sha256-gYaOZ68dIPAv8Ubpr1A6en8BvT0rXCcdbeDBXBbPqKM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
