{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "aa9c8d1b4602770462582668b114f76124737849";
    sha256 = "sha256-hS7ZhMWPKTviAmtRe+ykskG1AJXDBNsvSyXsxtCcxOY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
