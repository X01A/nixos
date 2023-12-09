{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d91d6c86f225aac7722e2fa4db03f59d18a5675d";
    sha256 = "sha256-6rP65omvFjKRb9tZKUpqaWcQskOAmTM/bSp8s6SSf7A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
