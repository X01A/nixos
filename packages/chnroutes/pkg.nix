{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "921014fbe81d8826952f2acead17a9ae707b569d";
    sha256 = "sha256-BDU/ffnOnHLdtTMFKaH1lF+25VJZo6Jd7is4w8c5Nic=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
