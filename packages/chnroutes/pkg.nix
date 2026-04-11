{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d7735a3ec8260a16614f32c60d1bc10f0e3016a8";
    sha256 = "sha256-B/7kLy2/XKGETEvNY53jwh5D3abw1Rl6nik5SuSafFM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
