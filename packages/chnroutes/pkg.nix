{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7445122394c3478127c6fc6469d905df5f5ffc70";
    sha256 = "sha256-GGy+Quf03hp1i7W9yDp8hEoQIXk7n8YzO9cMZtQ13RA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
