{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b773e1a34c5e964110eada4e0b13e74bf827c076";
    sha256 = "sha256-Y2i/rKtIx5w4s6ZJyfIHVNl6cD+fvIytf3xYKxBYpPg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
