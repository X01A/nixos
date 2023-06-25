{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-25";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "a6307f403bb056abc925d5f040b5306872a330d4";
    fetchSubmodules = true;
    sha256 = "sha256-WjySxPYDhwcX2edfiwDCTp28E600wOfnXCI1z8Fa/Q4=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
