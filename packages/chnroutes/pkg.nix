{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "36b8fb617ccecefbc4fa3c9ccd3a14a8892ff10a";
    sha256 = "sha256-8btqxaGKe9x3Sgqt8/9pY3ILu6WIjadwnXFzh0/5W/g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
