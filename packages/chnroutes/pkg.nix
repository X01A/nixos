{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7306c4fff8cf107356bc13191ddac1ee2acf75f7";
    sha256 = "sha256-C+mrokbRvJakLk6tb4ZhUfZ4pla50YMBQvhXAzomZpQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
