{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "83694acc2cb0f958cee32e5b1029d7c4a34fcf49";
    sha256 = "sha256-abVTRTUXL6EG2K0H+jJy3wBX78WAHMAGYO5Tz07uLhw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
