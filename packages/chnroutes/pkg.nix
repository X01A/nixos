{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "dd387456f71f4e51cb4c2445299f11f1a6d3d4a3";
    sha256 = "sha256-7L4ZgcpHZv3s00UnSdCOa24vNPE4BWzOcb+3HLtAxzw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
