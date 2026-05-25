{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "89de81a31415cec8df53dff855d852f720e2c2b8";
    sha256 = "sha256-ebtNsovV4xuQc6yn5pfDAgqh2bIIkd5nMN0gzQrXKPE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
