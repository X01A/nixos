{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2025-12-31";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "eaf2d9834eb7e3d5447b72a67db6dbc5f4940c7f";
    fetchSubmodules = true;
    sha256 = "sha256-msZ/OGU3dYzkd//908Zfis1hNcpD0GukKbDx/VG2FFs=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
