{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "22e307174afb33512104f99198831f2ebc92a070";
    sha256 = "sha256-i72vTEFxVwp/F1NMFpbyRWpBvqpx2mAQzX5I0RlhuZU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
