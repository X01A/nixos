{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b85a4f508be8f6d86d35d93041f7443afcadac01";
    sha256 = "sha256-+71QwpXC6EyLKkBrHzOWZs5W4vvHfOiu5AKHnXmcvN4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
