{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "624f4e5369a3e5abccb0d0b53a69db4253329a1d";
    sha256 = "sha256-2F3ZWdf+ISe9ok/aboKFm5UPuzkI2M4AQ9d1Sm8zuGE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
