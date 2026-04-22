{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "182031f45f8f9770b6eb73f1d50e8a94f1e36ad7";
    sha256 = "sha256-/nYTbG8kIf+XdJVsWVkqEW7npV4HRMbYvXsdNvQLZtA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
