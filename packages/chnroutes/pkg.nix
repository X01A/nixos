{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4cd8b917e9f00b4bd1222b982ebab8aed603fa58";
    sha256 = "sha256-hSdXSEt8V0GhKcpnDYPPY3ukUmxRnCN7SIHgx2pkCCA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
