{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b8d79b058e9eed271321c36111f17742f58b0aad";
    sha256 = "sha256-BU6xxUJp+FiXdZWrvz76XlHKwrJMnzUwxzW8BAQVlQQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
