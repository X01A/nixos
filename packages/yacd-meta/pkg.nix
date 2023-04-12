{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "bdc6e0ec22b79c4f9a7fe46167481c2528298fe0";
    fetchSubmodules = true;
    sha256 = "sha256-Hvxxo1/Zs/fqiP3A72oPPKYPoeepkRmYSNVWB+FQt1I=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
