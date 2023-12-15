{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "17ad0ba9d1562b54b9b1622d6cae02eb28c9c155";
    sha256 = "sha256-iwCW0tSeiFciN67J4kD5c65iuI4y8i3/TPl1toyRRxU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
