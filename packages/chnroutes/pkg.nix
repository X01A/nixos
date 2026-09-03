{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "f047538eaa9d4e9a589f2719823fd3b7effbaff5";
    sha256 = "sha256-Avi02iK2TZM0v7xISPoem3wNDq1VTExGjO6RW2qcNNw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
