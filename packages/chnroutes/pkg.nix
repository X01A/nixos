{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4f5757135594fe8b8795ffdf52dacfba21f550db";
    sha256 = "sha256-KkA4auHjcMDHrp3u9tKa6HKUVXkqfKY2ngvf2JyEh3o=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
