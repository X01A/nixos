{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "413ac867eb2c2c451009f8415b7142067f510f22";
    sha256 = "sha256-zJTFnsZ1BfUUbm/iabCLexF0OyHuyYx3Sdb0w9eav80=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
