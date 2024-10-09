{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c579e1ca96d8cb410794964a3a4774631b4a0265";
    sha256 = "sha256-8c85GPOyblSDuHasN7mW4IQSEmry5lYGltqNLWbv7Hw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
