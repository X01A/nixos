{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7550a49e6fe510f3d39c941a9e5039ee7860b150";
    sha256 = "sha256-5/mgd5wgylADt9W8kTzeAbtZqtBfhgNDV1qLKE6JDHg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
