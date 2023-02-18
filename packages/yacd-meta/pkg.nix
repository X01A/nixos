{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-02-18";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "3832b605473e2660fa29279376a7c3aa764c2959";
    fetchSubmodules = true;
    sha256 = "sha256-H7wLbJvITfTKSW7EaIGY93k0K4ejg2lQndI+KhQo/3w=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
