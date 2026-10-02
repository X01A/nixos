{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "fc22878e9550905f4775191baa4bd8cb205e7e18";
    sha256 = "sha256-751ZZUigPBuZcc0yHr4umFDWpRvF0V/YzgunlzKYf4U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
