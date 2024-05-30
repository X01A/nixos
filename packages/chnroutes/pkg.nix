{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f7a640c3010285b8f0715fd190ee379dd38a691c";
    sha256 = "sha256-WIIsFSLpXSY5QQpiRPAUi7J0YvK4Al6Uled5576icEY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
