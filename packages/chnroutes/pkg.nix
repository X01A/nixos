{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "58633d42bc8fd005ac35b499cea2eafba904848d";
    sha256 = "sha256-38TxqP8Y8C8m5eYcTYjgD4pj9pihqAzswGF/J/vUafg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
