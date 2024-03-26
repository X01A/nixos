{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bf53c40f2311249fed2a42c4b9e2ac94db47da56";
    sha256 = "sha256-1HCYOrQwnfd3O49Rz1clqIu/78BOMylFNMvVCnf762E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
