{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cac477e68799643ba283470a6ea7ebc3f9788e76";
    sha256 = "sha256-k3Y5UHTfkRoZGMKX3s45h8oS1ET2VaNwyieEstxhzD4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
