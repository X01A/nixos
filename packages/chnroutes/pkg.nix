{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "57a6aa32fe4aea1fd2eb8afa6b3359b964284dd6";
    sha256 = "sha256-Gbpr7SnKsj+LhlaHcYk2anK/rwtZ1LMsBMWbpkHtOR8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
