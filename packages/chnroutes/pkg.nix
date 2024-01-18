{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7bf6b2c997bbc57fed3f6e18658a4b939d9b9701";
    sha256 = "sha256-nOOWlGzaIG/YbpbzyOMqn9UN7cep3alf13YMqHS1SAw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
