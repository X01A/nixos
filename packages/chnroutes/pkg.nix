{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5b5cb748677420e77004e5fd43b0ab993659ebf1";
    sha256 = "sha256-IWZ2j899XT6j7By1bEV792Cr95ycWvuwnh/kW+LBXj4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
