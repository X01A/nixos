{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "69d2e60df39ede62bfe5db7c0c93b2e5176e3224";
    sha256 = "sha256-kBGf7KCTgq+I5eYhJVGGQdlg4N9ueKEFrtMaX0GecD8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
