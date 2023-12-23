{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "124e9deab28ee48ba81dad779fb23ddcb76d1c51";
    sha256 = "sha256-dIpubr/HXHexy4RzbvdpyEl/UHPPpYhWK1tcDVYvpRs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
