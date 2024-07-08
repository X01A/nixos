{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c5d05f7aff7dc190c86aa44e5f8adde229fcd180";
    sha256 = "sha256-4QH3vc7gSBlXbjQkM6B9A4ma1pC5pUam5UP9ZxC6arY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
