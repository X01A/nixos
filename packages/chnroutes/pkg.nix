{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "188cb5bc001810e9f3bdccdb37f780c592c6da43";
    sha256 = "sha256-CmEfTKtY0IsPa+N70mkWpoHKfn7Hp6CGAgHduvryJjY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
