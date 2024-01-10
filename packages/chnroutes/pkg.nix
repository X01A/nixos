{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "961e925f06e58d69e7052b651453bb1a2f4b580f";
    sha256 = "sha256-Gg6shwXJFuKeuXaFeJT5zjzORBh/WapD5cp7Fi4SkZo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
