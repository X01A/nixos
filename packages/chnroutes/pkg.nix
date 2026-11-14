{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8ba8e2bfc638f3585e09a61ac347de78dd49e8a0";
    sha256 = "sha256-428QerGBCU9hHTrRQ4RIM+6620darpB6Yit2sSic+ac=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
