{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bcf5fca440873528fc623c5b54eb0f3c8fad08f4";
    sha256 = "sha256-iDA6QZjKPhi/VjNw2e3Jkj1FEuIKrCI2npu71At1q6M=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
