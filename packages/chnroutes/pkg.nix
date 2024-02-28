{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "324c229aad9742fc772ec1785801da489b4fbdf6";
    sha256 = "sha256-AGz4fKVrU7KI+OAjsC6FhWMpH+FhHnaPT3btiW09o6s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
