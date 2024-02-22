{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2839e775f9114e7475a6d7fd06873b3f19afaf6a";
    sha256 = "sha256-blKTsWXZgnBc0uvs2ZY/a2JbJWtgdSktnmcRXxHuARM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
