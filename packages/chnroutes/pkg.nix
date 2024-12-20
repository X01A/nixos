{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6059be90723b48361abbaddd79bcf7999738f37f";
    sha256 = "sha256-xjlwmOZ9yt4k9TdcwZtisCa+5lg6RJX/UDy4zmGJjT4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
