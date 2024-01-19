{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "12cee74bc5ee8c742630beb3aa83bf0658303bde";
    sha256 = "sha256-hBkSt3UFnOHcKZo8MfX0Pn534hAvMbTZbTE8Kyd/j58=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
