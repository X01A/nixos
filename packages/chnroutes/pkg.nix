{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cfd7f27932624c38fbb25afdf271a1f5235ba69e";
    sha256 = "sha256-thIadBIwgj2qDgCBgtGWLkv4LOMeTJS0ADdeL9534O4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
