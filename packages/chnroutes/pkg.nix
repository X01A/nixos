{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c8643bd7c8d6915a31748122455202a620ec6068";
    sha256 = "sha256-r+lGLHsHTAhfiQF3bpSSLnlzJWsQcV17t1luhcAQe/s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
