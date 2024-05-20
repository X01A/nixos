{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "31459b3653a3541f7f87236ed8196a07a79610e6";
    sha256 = "sha256-eIRdUbPRUrHBC5zy2YXMVHGYimenNYUyYkTHfUXsLTs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
