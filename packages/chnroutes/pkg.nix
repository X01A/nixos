{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "395b63feb8da9baeda53795299eaad3a78f4d9e4";
    sha256 = "sha256-qCHa6FmekWk3bd/8NbjaxZtLnoAVIiLvr7VxAcnZ3Og=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
