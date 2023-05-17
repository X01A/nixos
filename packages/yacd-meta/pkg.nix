{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "c1f457c70905b981bdc16af2a7d0d6f32d250afd";
    fetchSubmodules = true;
    sha256 = "sha256-QtpqKBINdHVwRZZ9WCox1gBAtG6ncDmVP30XIfBvaw0=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
