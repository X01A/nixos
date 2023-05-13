{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-13";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "9a483eb3f25b2b3b129eba85960c78cd08809fe3";
    fetchSubmodules = true;
    sha256 = "sha256-nv9qOej99/bF2OiG1Px3J9jizX/dmlZi+QFhcOB0enU=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
