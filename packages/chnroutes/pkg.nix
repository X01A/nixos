{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "992b098cb458e613db316b25ec76a0f637b66bcb";
    sha256 = "sha256-ySdCbbzOSsOj0HkxU3GjB98oxzLZWVWcnT79eVy3tp8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
