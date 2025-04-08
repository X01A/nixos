{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d8124738aea4ca2d237307cfa395b6774db29269";
    sha256 = "sha256-Q8Q0UQfq3Bm1zmJgrRv2rwNO88rqU91XAdivRbIw7M4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
