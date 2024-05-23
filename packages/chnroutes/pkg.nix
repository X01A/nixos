{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e545b74e428f6818c51e80b64e8618dc22fe1ee4";
    sha256 = "sha256-K6q32jU3s3mY4+8e/LOYrlRk08afUhdDcZh+QDQl7E0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
