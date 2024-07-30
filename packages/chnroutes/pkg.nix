{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "836901460b016049431106074ef225bcf2efbbd6";
    sha256 = "sha256-wqjrMq/t0M6I4lSFTGaqbJXfzFi69f4muo2iwqqGQ9w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
