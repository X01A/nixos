{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7fcf7af03bf8c9ccaab343c2bbe01c44399522a8";
    sha256 = "sha256-5z0yD9YnCx7GoPpWNaFBP9O43quvl44S89HEAe6V2aw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
