{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2aa80859c34fd7add6f54fc5e39cdab6464ea115";
    sha256 = "sha256-0VilWvUJ7TJ5NuunxdfhxY8W+lWebY+uObJPnPluJTo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
