{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b017c7fecab7f1afc5f0a9cb27f02ac90558eba7";
    sha256 = "sha256-85+Dk8KBIgHX55cmZX7qNt0nqKAMAoODU9PAk/vq5yc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
