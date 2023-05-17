{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "01e63f32fffa746b65a5b7b2ebd098cd7c8a317f";
    fetchSubmodules = true;
    sha256 = "sha256-UCZzQuGwPhccojmHg1WSIKB9vEKleNmBbRWP8DLm5M4=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
