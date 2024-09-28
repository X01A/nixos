{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3cd8f8cc33f054162f3886a904d4f7c4d2cc1600";
    sha256 = "sha256-rdA/Z4XjnsEVIlbqFjpZVDBaXeGZ9roywnuAX1zvE7U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
