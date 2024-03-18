{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "769f9f32f1cb55d8b87aa9d101f054487c6fdaf8";
    sha256 = "sha256-h9RVQRrEt7TDc/UYoGmHUygWH6D97vIPjrmZXVqfLUQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
