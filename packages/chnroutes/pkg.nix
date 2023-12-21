{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5b039a961e66d002e5ec4e6ffa1a0a33d3e6110b";
    sha256 = "sha256-hzuW9CYVRON6lzchMIAVVuqvgJblLZxV5JAjXZZ04ww=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
