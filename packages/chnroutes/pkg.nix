{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a6ea2afa3ce1a07070763a009afd866a718aed97";
    sha256 = "sha256-MvvHfjZ2HHzBKsch/RfYQG7uf/YTeDfvJkkX5VKO9j0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
