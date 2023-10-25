{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-10-24";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "d94b9c7283dcc41b7ab0a19c3c39d6f1846526d8";
    fetchSubmodules = true;
    sha256 = "sha256-8ePycNHG6bV0L5vurdC79IJtYN/OU1HxKjmsvs6CCaI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
