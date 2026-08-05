{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a403239099cd2d2414c2de2347b4fdb2e9a82519";
    sha256 = "sha256-h9aLVxlUpqlcKtFvEEDy3uzZTdjbLWJGPKShY93Qua4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
