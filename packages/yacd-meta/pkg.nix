{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-10";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "c45d77cfa1628890b254e8e28b6a260c0160efc4";
    fetchSubmodules = true;
    sha256 = "sha256-7PmEg5Yzo8NoWFEFU4UQa2eKLE4DEnrxmTfH/FU38mE=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
