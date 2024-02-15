{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ed6317e497e41569fd970dd17cd19788aa14b631";
    sha256 = "sha256-KiQ6sQTXK3LGMQFbEjpKnqobrbNK2d3rGPsOS+nVReI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
