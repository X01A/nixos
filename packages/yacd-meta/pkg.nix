{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.7-unstable-2024-08-11";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "8753c22b66388f07b64d72c60e5c479b63d15c5a";
    fetchSubmodules = true;
    sha256 = "sha256-ja3pf5vbXoNv9wxEmglXL0WHlSejcSVBnivooI6aeLs=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
