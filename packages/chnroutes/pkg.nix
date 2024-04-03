{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6ae35c0cc2bd9d4a92b15d6f5dd59a4008432983";
    sha256 = "sha256-tFKEuIX0WaWyC/9o6G/djsRjUzusm+f+t1yCx7ojXwk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
