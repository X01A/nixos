{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a4f4f912458d17c9b133a8827cead331b626a73f";
    sha256 = "sha256-PcC3UPiJ8YD95NauH7/4ign4/l8nM8+5QFxqTbsQbVk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
