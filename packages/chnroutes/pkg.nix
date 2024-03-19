{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "629a33f9178ac9bf6b84d708e8785a06e9caf6c8";
    sha256 = "sha256-dY8zV2BTgAcP0WNRTKrExpCSj070DKMsSq6A6wOyB08=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
