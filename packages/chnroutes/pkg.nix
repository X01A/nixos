{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "91b2b0ee3fee45fe48cc6337e0b3b2011049399a";
    sha256 = "sha256-fbJC2gT1YHdBdUTz/eSdw/m9iFUqn8p89Lfb8EQS9us=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
