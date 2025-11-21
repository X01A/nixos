{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1303a57a0b5293e1bd958dd4dd18fb52de5787be";
    sha256 = "sha256-K7uyY3RR+gL4AaXQ4DbeisOKTNjw6FtZe66r22nJP68=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
