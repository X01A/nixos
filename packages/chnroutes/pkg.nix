{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "50d615fea5aacbf16205e51a3d84232e71348c43";
    sha256 = "sha256-Ep/ghGfxR7TxeToNrxmhlqCjCXoKP3OEsMdPOykJVlE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
