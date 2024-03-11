{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3abd10329b14376fe7d04b28f85abcaaf1ca3966";
    sha256 = "sha256-n55jxKYO9OeN17MR/aonT4VptI2jo5MeYfKVYo1ZrNk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
