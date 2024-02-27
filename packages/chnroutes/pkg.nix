{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b2fce009bc402a3f9d6e4819343af7e8dab3d3c2";
    sha256 = "sha256-krJvv9ykcIabFn170K6iy/ipfrQftTPqTGvVRmuH4jg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
