{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d5c3e25d5ab1de9ceb4bccc731a1b0771afbda10";
    sha256 = "sha256-Y7iR+JDWztRjao4QpkuGLzs2VdRsYiHLBT6dg3zPXko=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
