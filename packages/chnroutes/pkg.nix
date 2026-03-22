{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "12ae213ef5531b211a9708f937bd2d98e0c672e2";
    sha256 = "sha256-yBQGZccFNlAIS7pxDprtLYmlSBw5yXjMCP2eB68QIi4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
