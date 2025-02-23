{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b92a949e83584fa685a14e6e390f5808a84b7998";
    sha256 = "sha256-/tg35qKyRSE/H/qGqyVxY6enbJpMEJlMT0Q+K+gQdkc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
