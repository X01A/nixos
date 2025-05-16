{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "80ec947c4bc4bffa68b9f3ec471f0559d35073be";
    sha256 = "sha256-nF0J5o0MRp89XmfYLFXq3Dehg6Cgfuj5ATX8B2lYLIY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
