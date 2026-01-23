{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ce84c405042d247da465e1d1a3e50ae202c5a837";
    sha256 = "sha256-v5z6XUvcUZkCzexAeMNDHKlGqP5b9zKl2mZUrCwi43w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
