{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "99625d78d52e5909426cddefb66376767a1d8298";
    sha256 = "sha256-tJTFqUJkmxZwWM2qAHZW1gBvk+gmr5i/bCmXM60QJh0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
