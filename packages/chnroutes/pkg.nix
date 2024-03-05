{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "81350b03f5d8853621a613816e63644352e52d6d";
    sha256 = "sha256-QAlYUSc8htQBuG//KRO/H2fKFqBJO+NXQTTl7DZj9+w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
