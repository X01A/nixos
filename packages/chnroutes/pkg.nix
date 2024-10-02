{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "88a80134cba945b8dc192c60659abb057fc770ed";
    sha256 = "sha256-BzLfwQCHa1EpLU1y83fcqDUkfkTLEzJI4qT994WtQn0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
