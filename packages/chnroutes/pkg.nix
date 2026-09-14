{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "5802f7095d10c5fc0eaa6054f556db3ed807919f";
    sha256 = "sha256-KeKTJK+fLPtPFv0CQbFmjdaU6H6IQhNxyE8gfutPJhg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
