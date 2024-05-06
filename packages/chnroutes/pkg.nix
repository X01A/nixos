{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "243c23a8d733f4da7bc9c1b95ed0124a73965795";
    sha256 = "sha256-7zO1BEGh0uxgReY10o0HGshZuyqkAsX62iK94qI5zlk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
