{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8110e8a410608987c66372d2c1f6b9301966fd6c";
    sha256 = "sha256-mOK58groeIxVy2vKUUeszCWn+TQ2vC6oz/Nmqd0sQ30=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
