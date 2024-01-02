{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ce7ac8c0602d99ab8c80392dc310282d239c75e1";
    sha256 = "sha256-ZvEJ/J08DifmRPp0+qMWxz9h6yrJwKx1FFaYUuQX33g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
