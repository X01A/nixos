{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "540e84706df55b0b40d129e21beecb72d255846b";
    sha256 = "sha256-5d5LX3ejsyqRtCU5QR6haf8oil9shNex7V6XBXhXkuk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
