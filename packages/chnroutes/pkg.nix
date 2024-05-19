{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b6c156e89aec778fb1bfc13eee21710a071a7498";
    sha256 = "sha256-CwOkuz3H/TWyVKa3MdW6piUml/iS5uaBA5+ZJkQtYis=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
