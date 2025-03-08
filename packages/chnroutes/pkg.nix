{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5414f7a5937a18797bb7c3a4b5819912a752970a";
    sha256 = "sha256-hxlZnbvSUBnyQZHtCQ9bZGzKmOBGjY6TPUogoz3qzCY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
