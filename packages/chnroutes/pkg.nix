{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "08b1ffad7bf5dd5257ffe1347dfa3b91e2fb0719";
    sha256 = "sha256-jVSzGjfbDSq8kqZpG/xZzjgsS8JqaAxGGfn67Ju40OA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
