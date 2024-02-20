{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "294f54794ea27f013221ee84571b8d80a8f37eab";
    sha256 = "sha256-kOEAo3i8wkhMo39mHboBlQ65XCIbEQq+ySAUZn/XVpY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
