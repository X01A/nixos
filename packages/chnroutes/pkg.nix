{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4a11303fc2e5e8c1fa9232ad3af0c62738816a24";
    sha256 = "sha256-IIeOfu9x4o+N+O94G8OGMDC528/lvABFpL1ljNTZ79U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
