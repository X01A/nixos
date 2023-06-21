{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-21";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "c7297b50d9248ca13954eab0c3956cf0217d38ba";
    fetchSubmodules = true;
    sha256 = "sha256-2IW7XQpvTdRCEnObMvMBAcPpGGV1kTSHLkj9AJ37te4=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
