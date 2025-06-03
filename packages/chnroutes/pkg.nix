{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fc2e697d6e166599871b3cccbdc49a9e29076dba";
    sha256 = "sha256-++q7kTP0HlBbEEFdPDj8v3yiQ6I9rA3lHvPVKhEyVbE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
