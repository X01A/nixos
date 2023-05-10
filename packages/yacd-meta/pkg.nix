{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-10";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "aadeef225c83af0eeb55befd4434a8fe81290956";
    fetchSubmodules = true;
    sha256 = "sha256-UWEyrxbFX2Hknny9wKwUQAKAqATzgbNyact47SLjjv8=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
