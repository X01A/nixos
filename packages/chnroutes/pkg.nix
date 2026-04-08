{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c8858ce2e62ca6991bae9628398b8dd6da6bffad";
    sha256 = "sha256-NpxNh9EEJ8S8oM3RzP9lDqBkBe21IJl501tyLLfV+fs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
