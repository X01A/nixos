{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2cdb134d4f0b2acd0270dc0f87b55d3f87c0d65b";
    sha256 = "sha256-6ebo4VjNPlb4m6AUv1GF08u6YyLKUvKGG59JyM3MxiQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
