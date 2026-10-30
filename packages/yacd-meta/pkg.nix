{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.6.0-unstable-2026-10-21";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "4a759007e8887da47d599f88274faa9810feadcc";
    fetchSubmodules = true;
    sha256 = "sha256-1sBbwPz+IpDoKxVjpJZufHkj82Guu/VCL9+aHT0NNeY=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
