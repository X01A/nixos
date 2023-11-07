{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "961b12cb4b2834ea9edef14cf8fa283fde6385b7";
    sha256 = "sha256-/4h6Pkib7sgWYwCWtur8nhrGCCEs4v0WGVJoZzLhbR4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
