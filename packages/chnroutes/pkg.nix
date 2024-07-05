{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d017ac774d0645f3db6caac892daf52a28b5f4a6";
    sha256 = "sha256-8vrOBnc/gRVQNVJ+D3IsantdRe0g0U+nqk0lDwvYuwo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
