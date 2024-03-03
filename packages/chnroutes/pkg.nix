{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8e8b99c24b775353b0fca52fb438aa07d78485c4";
    sha256 = "sha256-Z5yrptDVdlYULPSZS9btLysSjNP/axs5G8a3A31oSDg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
