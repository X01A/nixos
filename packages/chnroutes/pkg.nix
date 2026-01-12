{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c2d22de2834ef0ff797dfda8f3f4f5604d83826c";
    sha256 = "sha256-+FUec4TgXVLvSMzmMTp7mRFsAQjhG4QMKldDU0sKtO4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
