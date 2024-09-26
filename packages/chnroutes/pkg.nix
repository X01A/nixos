{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e80c231ddb65d35810889b44b854125b8866f40d";
    sha256 = "sha256-FkrnKQDu4RoKpeKjPQMOMNW3Q86SQjJWjU+vYiJBn9c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
