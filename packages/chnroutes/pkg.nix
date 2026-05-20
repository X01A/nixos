{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "777d3145d1ada90bbcc710b294fe234916b9dddd";
    sha256 = "sha256-6c6f79fKBh5TgdysoMB9UgCRDu91Kr2SGC0aohyq9xE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
