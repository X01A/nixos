{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "49b23946f2af2f7285d93a5f30737e3809a7dd2b";
    sha256 = "sha256-acmCQmNfzFJPo5++4Vse5Virhj6hUTx505TqKPzpO2U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
