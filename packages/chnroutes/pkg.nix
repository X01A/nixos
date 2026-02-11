{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7aa9609450354490706b523f9eab074ead1ff361";
    sha256 = "sha256-GUuteI8gN715zpbVp5xWEGlpwfoyn03DeMQNZsXjR6Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
