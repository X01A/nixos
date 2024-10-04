{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b94c90a96b9bca9d9b06cf3475a2c3a5d2ce4ae8";
    sha256 = "sha256-rwHYbSPjmLR8a1ekjNxWbnjn14Ft2SHBjel7kkHE/gg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
