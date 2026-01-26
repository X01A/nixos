{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "19a7ab9c4a5dc6e23b573427876e83c77fd6a1ee";
    sha256 = "sha256-WMyqgZChiGme+a6o5W7POJ8SUxwz7v/f8/HijClkxsc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
