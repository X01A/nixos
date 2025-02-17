{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "506090ef46454d6aa02d98b459a9fef2b5546d01";
    sha256 = "sha256-muSZU89nYDRrTfxSEKiUGQIRqiuSr9DmWYT+vHQaYN8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
