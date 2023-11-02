{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b219269a9fe432491ba9aa8fdb3626f6c77bc20b";
    sha256 = "sha256-HqaxMvBz+v4Vlxa0KT1e8EiySGk7m9lXQ5UNj8N5E3Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
