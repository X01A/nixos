{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b9e0897142600ebe105ab3202ca59d7d586c37ba";
    sha256 = "sha256-i8A0d0O7wpOdb04x1Jl5xmVBYt17xT6/NpJVc/zVx5k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
