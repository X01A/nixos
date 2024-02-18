{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0e72cb85ad3944e2821d55bcc252dd27b5b0e97b";
    sha256 = "sha256-Ni4N1LhJ8q9YGfW6i8p7pSRsZ+11ZqjyrI6xKzX8z5A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
