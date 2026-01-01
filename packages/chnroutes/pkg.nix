{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9d719592124dd714099285d6ad4910342c2596ab";
    sha256 = "sha256-pIhIBMgW7D1rxmh+pXnEZo9B3tWSmPCUDFrqKS2VTGk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
