{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "dbc0862f10c795e4945f177ca245dc83134ac8ab";
    sha256 = "sha256-dhQSUOsxZcF3L5k/ZImfQ5eOmt4pj3f+59jHtfFc7+s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
