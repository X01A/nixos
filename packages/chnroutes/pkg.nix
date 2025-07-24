{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "267026a0275d80efcd594ee4ab5e0d169fd73934";
    sha256 = "sha256-WEPZl3ZhEh8j3p607mDt2MEhmg1SHFS2veKQ9A4FQ88=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
