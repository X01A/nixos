{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-13";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "42dad3145cf3d38e6698bfeb74d57c6a8521e875";
    fetchSubmodules = true;
    sha256 = "sha256-D76uXd3ZYFu+7sMU6tY1fKqs3bUsQ1hDDQBWUsid94U=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
