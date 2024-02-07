{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "968d5f8c52963151645fc07fd1b51a76bc041e46";
    sha256 = "sha256-z9SE2Q2IGh73ZOidPxT256N7cYJ8MuM9Q5nx9wjK1YU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
