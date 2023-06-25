{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-25";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "cdc76cf3ab810de3bdfc6df1b9f6b8ca9025adad";
    fetchSubmodules = true;
    sha256 = "sha256-89MQlN19zmyVXkYRAJNH3XGCtEUFgHFsUFXNk4bo+pI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
