{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e26716f40d9110065e46c45539b6a71d1fcf9855";
    sha256 = "sha256-0axEBFGHjjyQoz/lXTYtrvaBt28FjC+/jLKomTR0Ghk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
