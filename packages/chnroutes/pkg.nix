{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "010732468496c6aae8d652c1dec8a9d4942b60ff";
    sha256 = "sha256-BXHupdOGclRRxZhIODGxMil2xB+Zxk2EXI2Gq6OdDew=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
