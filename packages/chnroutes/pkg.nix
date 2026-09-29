{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "60d32388c50ae2c8bcb0d05d183de307d582f6dc";
    sha256 = "sha256-8LYZ9xM7AbtIoZXJLYc+MAVXpzNqbek5YUPxoD3gIAI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
