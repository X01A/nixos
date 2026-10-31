{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "66f6e1fa040907e161a8919f12474b3891f85a28";
    sha256 = "sha256-RL3DQbv54N47BqOBlSeE145tWMr7/YuDXl6FzcpXJfI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
