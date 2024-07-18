{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ecd12de6388f7c6dd69956eaf4de4878988dd823";
    sha256 = "sha256-9uCFvTgDJqkeM4kPCxC7rNuFP5eLPw7EAizYk4FXwc0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
