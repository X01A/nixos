{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3f2443346e3c64499f73b8cc6e5218d474cf8d25";
    sha256 = "sha256-PEqDhK8UEiqIXPTnQB4evh/PxbeaVS/6/jcRm5VLuWw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
