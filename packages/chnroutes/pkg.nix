{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8de0174737b59804f9e189bc5470666c3b9e257a";
    sha256 = "sha256-KUZ6h328/gZdBjzvwv7y13ZHpoF3YxzlgAnxpm71DB8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
