{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "eb5434863a419707fc5eb3647c9e91e5ee964db7";
    sha256 = "sha256-p0jXLpSIG9vhTMn2ESqDy85Bes6hoq0DDxMJis59FKU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
