{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "043a1e02c8ab0599b69d119a259824559b40bcf7";
    sha256 = "sha256-wE0Lsmbl1vRwP7SupWZzRMVUQ5jdZMuYLiS4er5Odgg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
