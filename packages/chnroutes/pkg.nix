{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3f233c7ce58b3228c06e9bf3e62603a24a7d4f69";
    sha256 = "sha256-mMXgDVSwPw3vtmEt5Yz4kmKE/zoElXw2feQhOgzIazo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
