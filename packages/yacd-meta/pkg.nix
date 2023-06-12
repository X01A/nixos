{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "eac8e4ee30c2dc08d8b48e1efc46e9609f3f06ec";
    fetchSubmodules = true;
    sha256 = "sha256-lAv5lPwpeobM4FM7NsF+fvF2vvvnF1At2JK0Hr2Hurk=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
