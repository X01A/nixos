{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "98d3dcb6dfa1ab48ea364e4b728086e66aefe014";
    sha256 = "sha256-O1OEDlLXxtw+BgOyPe+FtrgzIg1oUfP1BFdusE9Mb6M=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
