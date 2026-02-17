{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d99284628fcd2943882f3ed8fd3e2a5dc2fe0828";
    sha256 = "sha256-lFBi0RKk3ODj0U410ZeeDFtQ/2iVVhl0eaY2+Rscy9Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
