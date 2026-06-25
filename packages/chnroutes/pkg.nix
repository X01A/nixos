{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7cc5bdb67325292bfcc825695c046ec1e9f92e6b";
    sha256 = "sha256-Bvu6Sl2NYYVkuO95ndIFVV9lzWHbVlTDtz+FTGZ5AqM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
