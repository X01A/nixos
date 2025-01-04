{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0ae7feea43f8ea60a87d18ee272ecff3aa270596";
    sha256 = "sha256-j2fjJ5O9Sy1Iai2ZtNWjda2bXXvDdMEAvip/Tgd7yfM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
