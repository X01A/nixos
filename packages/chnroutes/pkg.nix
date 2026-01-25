{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "41af0ac2ba8911d31f1c4e3bc91e287a8cdbacc8";
    sha256 = "sha256-hTl1gG3ZmumkcwbmSNAxvd3ZYq1oxH9BZm0IIs8pmVU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
