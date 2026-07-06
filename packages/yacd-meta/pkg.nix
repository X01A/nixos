{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-07-05";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "debbe39b9365581413a96a0a8e8b2f8f5273a5c9";
    fetchSubmodules = true;
    sha256 = "sha256-LAIXJgIq2alf7z6aEwI3MeDKVijbHwI7HZbe91hP55M=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
