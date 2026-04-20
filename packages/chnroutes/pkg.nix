{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6db3a834341b4c0b534198a4961e3a49674352c7";
    sha256 = "sha256-/0PFVYJChee0l8BGE3OCCq9e5+CVqjPYmr1tavmQtlg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
