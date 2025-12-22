{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a7111181f28db72068e34304c1d1a57d1ef2ef4b";
    sha256 = "sha256-zZbEGbv0FHHLMpOCW7PckvXyOJ9QH3e3cbl8zQA9zTk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
