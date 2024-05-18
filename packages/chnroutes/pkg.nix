{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "43a413c12cc14150dda9398440dddf8249f743a5";
    sha256 = "sha256-gkcsFOmVy3HoxvFx+FMPeY1LySu4CwIu4pPIRpRGL24=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
