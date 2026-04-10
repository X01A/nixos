{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d771d958c08059b56fc11849db10715f6e6dddb9";
    sha256 = "sha256-HDQV2WfQZzbiQy/XmMuZo5RmnjvuNqdXt7qxWZOwNLQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
