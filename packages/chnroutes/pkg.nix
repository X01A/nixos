{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2481c7ef94d998798f4fa42e262d1ddecb5aebea";
    sha256 = "sha256-FBhfall+omiscXQP56WYpz0RV8RhnaUkd5YZeFxJIBw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
