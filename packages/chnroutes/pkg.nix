{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "24c6469ae5435c71a990e7b1d5f8efbade94054d";
    sha256 = "sha256-UuF0Oe2kXqnn5KwpNwkWiOMn4Ek8Y3GCDv8jZptv9Eg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
