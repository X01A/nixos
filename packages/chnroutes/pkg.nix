{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cb89d06d8b06f1f62b54a3f70946f4e56144c1bd";
    sha256 = "sha256-p/Edg7TAuKKucNj+OSscPE1JB5VsNeMZ3FGV4/fX5fo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
