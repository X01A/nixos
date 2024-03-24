{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "190599dbc5531053efcb8a887483e078b6a4f859";
    sha256 = "sha256-N24c7KJafcpivFnfMOBYnxFpPgyPzkxeg/rJA9ALfGA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
