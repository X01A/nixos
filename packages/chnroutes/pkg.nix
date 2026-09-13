{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "87e94488ba183c53180b74f301f1097b0b5ae6cc";
    sha256 = "sha256-+KvM4xRWXsuF1eLV+qYYzaH0MCyjYgGs3BB3ZjsGFn0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
