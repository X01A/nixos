{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9ace4ed67c69223738294b28853f1aa55e5a71c0";
    sha256 = "sha256-VGyQuxuCUsd2YdNA0PiMplFlQnqKVTwTfmEqCBGUhv0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
