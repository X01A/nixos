{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "485d088ae289d8b2476748e8fbeeaea1f56d1b89";
    sha256 = "sha256-vGuSTiJ5GZeHmTw7Lp3iryL/TUux4rWeMU+WM0SZ0hA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
