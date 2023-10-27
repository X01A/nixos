{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-10-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3e8d7163e35c08247e281a2d2d1bfa244ca87919";
    sha256 = "sha256-kGKxVcdOPLP9jh9LlKqnftbawElOdNKe+jjYP9VgKv8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
