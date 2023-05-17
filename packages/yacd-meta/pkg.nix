{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "5b74724727fe47a3f1199496e6f7725ef3a1cc83";
    fetchSubmodules = true;
    sha256 = "sha256-qKFwh0TyXZph/SLY+alKfyv9omSTjU5HOM6dyQJwvRI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
