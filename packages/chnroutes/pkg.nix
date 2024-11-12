{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "537ca7d2f2325552b7a05ec3a1faf6d9e81b98ed";
    sha256 = "sha256-NFXHo3UqdFtn5/0u5WxKZGg56NOcf5sAnx4MOqZUzDs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
