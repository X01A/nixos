{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4c4ce38892fa71873bbe1216b0e42564e497e94d";
    sha256 = "sha256-Kxo3GR8RUlMTCbaHaM6GuZhuPZa/ND1qdcKdlhy+PMA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
