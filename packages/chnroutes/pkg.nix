{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "493a37e1bebb2b57111a4f561d949b21fde1ba35";
    sha256 = "sha256-+YZ8jq2s52IZr/qh/k8sZo1nfb8eClns6zAMY064q5w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
