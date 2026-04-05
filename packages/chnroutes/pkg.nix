{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e5f74b8ddc214d178ef27d4f17dcffeb7e26d262";
    sha256 = "sha256-QK3BXjrFF01f25hcKUPKdQ5NGJ/BD19faw/1d7ZeuPY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
