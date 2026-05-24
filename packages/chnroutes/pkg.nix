{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "de3e9207a5456b0b88cb3d8d6c85e6f4e8c68c5d";
    sha256 = "sha256-eEtMDpWEg1G6MU9NVnGZX65rORpn7VLKcBG7fUVvT5U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
