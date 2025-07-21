{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fcc5e61dee8a918fcdb1c7ecb31794657a4972a9";
    sha256 = "sha256-QZfPQfAB/jP3vOV+t4fFdBx6ApepMNXgYOT5gMYKG9c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
