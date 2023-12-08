{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1b5f679f2ffd5b29840c011f9afa31e0c45f8930";
    sha256 = "sha256-bRtlQbxpEmoOyK4ovFg+ByNvR0UoZnk2LzTG1Ww5Ffs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
