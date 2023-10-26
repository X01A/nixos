{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-10-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b76509bbd7b823cde62f33679e947b0a620c2f35";
    sha256 = "sha256-grUm1lNYiz1n6nlO81wXZzwuDP/5U1cFZOtLJwnNhF4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
