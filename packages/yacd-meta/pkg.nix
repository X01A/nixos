{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-09";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "5b7b41dc8c533912bccadbabe5c26c08a180dff1";
    fetchSubmodules = true;
    sha256 = "sha256-rYdfSIqWX5WepIYKVGAvs1Zk163I2RsF+eN7/cJ9rQc=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
