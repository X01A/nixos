{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4fb2d0bab48b25a06753e487a37d02a4ab19b64a";
    sha256 = "sha256-T72gyD++9/yVxJmrU+SejxugmT+ghMDBPQS3GuFBvg4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
