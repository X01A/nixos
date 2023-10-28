{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-10-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "62526cabf398c334b06401352c250739811636aa";
    sha256 = "sha256-tSY2XqIcoXCs2kEOf7+5GN9lX7a3xk97qK+FGYEqYx0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
