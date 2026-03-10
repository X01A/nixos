{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "53014c2b58a400e5764200b2ddd224607b3c8319";
    sha256 = "sha256-ra2dupCyt56wzfPJ5Ala0kfvMNI4bQt+rtG/0ppafIw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
