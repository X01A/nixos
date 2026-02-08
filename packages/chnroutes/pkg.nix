{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "243c6f6a7c10e64f32f986f38d9486c5316d877a";
    sha256 = "sha256-A6uIeJmPpKlvBtpZwFl2K08dLmlArSA+HTPfSU9wnZo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
