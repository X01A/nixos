{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ae73ea901e5d5ad89a942d599a8db0fceeb25f62";
    sha256 = "sha256-8we76bxtKtFE4gGf9oetetimSUsujU/Slmwq92BxkFI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
