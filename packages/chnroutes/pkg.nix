{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9991b6e167afe1f7074bf748f2de9c1cbfb946db";
    sha256 = "sha256-8tO5S+mNVra9WxP3GZR2fLPD8aE8cQA2rxfYSYe+rKw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
