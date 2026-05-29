{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cc353c2631184ceb3df96a72372ef8ce245d8fc6";
    sha256 = "sha256-JGbL0rioDW2DBkcd2GJ4vZdi893N+0xeMoEMPGJnFXI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
