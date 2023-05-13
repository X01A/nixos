{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-13";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "7f092fc7f8da31e633bd434854b357e77cbb01b5";
    fetchSubmodules = true;
    sha256 = "sha256-qu+4H8YE56QmMO7FCsdeLw9TD28C3Eqs1N+Kxl0G7s8=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
