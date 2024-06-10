{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "808b4eae0422f68fe60f55458eb597ee7bf7f2c9";
    sha256 = "sha256-hkCcwnoFXGW9df5S3V3qtY0/kBKryu3wulDp/OS5p8U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
