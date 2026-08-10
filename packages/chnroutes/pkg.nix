{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3f27cff57f27c5d2598818032d1c7ce7113b49ec";
    sha256 = "sha256-ciSLrbVCIDuOkuXFBzOb3ot3ulN27wPWyny5v2Gh6TA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
