{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-27";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "44c627ab728c5585f734fa1c4181f643494b7435";
    fetchSubmodules = true;
    sha256 = "sha256-xMwkw1ME+fVoTz16J5o/hVscEXUDJYTUO1OZNTg0VJI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
