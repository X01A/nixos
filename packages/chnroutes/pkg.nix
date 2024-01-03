{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d2b18f43d3e008d2dfd81943e6215e0302f91619";
    sha256 = "sha256-moWVoaw3jvyrL6Z1WM4xBcuVbZFlbhrWdl2nkMlQH3U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
