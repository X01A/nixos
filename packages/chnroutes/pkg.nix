{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "63995ac6642cb402d58b03dab3a8d645e63d55e8";
    sha256 = "sha256-TJwrsbQgO7PtvcMUc3wEmg+Msvyc7CnYLzv47igy8Cc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
