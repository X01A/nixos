{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ca6d839e0c61ed238e1bc5b02ad68e1910b76151";
    sha256 = "sha256-EwHYnGiyHXKTeRi3RqXgvBag3tA6+Gd5SB5sDE4gsxI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
