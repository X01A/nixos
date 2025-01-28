{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "81225b30038f7ba73371de3d3845f5215474c29f";
    sha256 = "sha256-aK8shC85J6jf8qYRMxpgykjh6nzjk2gqw47keJPHcTg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
