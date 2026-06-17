{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c6cd0233936783c823ad3b4cdbbbbdaff2b0c271";
    sha256 = "sha256-iweFq97jiexwruGnsl7exJLVwoaicA7cI3rmDZjagRc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
