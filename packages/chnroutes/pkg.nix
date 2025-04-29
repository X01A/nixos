{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7595b7e9c47c44ad4070d62d508ead62cc4ceb71";
    sha256 = "sha256-0VGN5iRJECBebXs1vWfY3WKpimPbb+WfdU1NxzxZ1eY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
