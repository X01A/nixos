{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9057d8c82c486edd937684397fe098144e64bf86";
    sha256 = "sha256-rdRUHYAoghRfZKE1t/E6mnpP7Q81kPal6qaRPTiUmiQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
