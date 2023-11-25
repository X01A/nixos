{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ac243c2f9e5abe7ce9581350f40277b671b7b8e0";
    sha256 = "sha256-5z9LAWiR/FeN/uxtWE8yImQ7WETLawo3hQ00kRkVRRs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
