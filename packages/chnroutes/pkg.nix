{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ba55cc8ea9b1aedbae8134c134c513cb417bae90";
    sha256 = "sha256-QR13+7u+tK+siPUEZGqbn0tG6tZ+fNCTjpwUhjpNfTw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
