{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9dfdfa560d6b2412fce29005823b87a829ef7818";
    sha256 = "sha256-S3ZngGj8vGc5WTlm7mHq9hNQfnIlve0dhKNf+GsL5S4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
