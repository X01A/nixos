{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2738ee3c81817590a22d89f1f6ae430381133fdb";
    sha256 = "sha256-KpXUmktmtERtEKYHwnHqcfTNufxGdQXZKhwtDrcEUMQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
