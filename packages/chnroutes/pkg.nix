{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "edf9e6900932cc63dd894c913a7bff54b672c656";
    sha256 = "sha256-Tj+yLBydVYXuDMdnLxhTn77daw0QGGrgp+F5tsc0yaM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
