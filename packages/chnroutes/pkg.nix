{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "59b92d8aca802ebae324f4070883c92f7fa4570d";
    sha256 = "sha256-Dmph9wRwwIUioEbjt1SAqMDrYKtJNB9PAre3RQDcP2k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
