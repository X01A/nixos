{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8a807e1b7a5550dd697855f63b9c1d2fcc1914b4";
    sha256 = "sha256-QV7pVpyjrefxYsuUYyn845mD45uWEhzxPFLjTUFipWU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
