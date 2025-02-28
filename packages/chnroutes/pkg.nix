{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1897b928bf73a94596ce3c2c78e3b77e7f9fd41f";
    sha256 = "sha256-BMqB61sgSQDlp1jfnkGG0svKp0bOq6B95J0UWTVKumQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
