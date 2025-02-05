{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "72c5eddc55219d35551783cd6a045c81bcfcfee6";
    sha256 = "sha256-h+Uv+aHb1DsDJIVWn1yvYerDs4FVpZn0v3MMqSDKzTc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
