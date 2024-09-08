{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8bfe0fa1bfe11a6fa6b4c939d752b493a5e359fb";
    sha256 = "sha256-w5BWOLLsYKj6bo0Hg1MV4JVpyS7Et9DXG8mR7/iDQz8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
