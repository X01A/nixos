{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "424f87aa881d23377e7019f861d040cfe6c84818";
    sha256 = "sha256-ReG/9P+WoThT5O1kwzmwuXXC8MtI39MGtnSCtDxq/QE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
