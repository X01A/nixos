{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2033edef9a42bfb23341cb9162afc08f1f1f2970";
    sha256 = "sha256-if17dnwIwHvhvYugVn12nyi1FFyaYWxalv+PaFC6IDY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
