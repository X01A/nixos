{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-25";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "1327116b6ec770783c62c2a647b4dbdb776053a2";
    fetchSubmodules = true;
    sha256 = "sha256-nE8MPvTX41OqWrMHVYFIySA3kLAnr+YlBD9Ga1sM8TU=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
