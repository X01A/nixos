{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0f26e349c1a3afb21c410c9168513b32da6e4676";
    sha256 = "sha256-WFJo+ote6rN0OSqF/xJSBiNU6pFgsxGr/L8Hruc6ufM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
