{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "db167cdb542421c3dd14d8c76c388cafccffe7f8";
    sha256 = "sha256-eXBmxh0nSjmb7EaC+HJctxHEioPkNhMRcT1KWzmnnTY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
