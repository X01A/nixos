{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "043e83c827d355625400e30da3fb219e97a5d91f";
    sha256 = "sha256-ULHj176B4/ZGYv3Pwp8/0qFvsrPpZ2M8R05hbCPDm24=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
