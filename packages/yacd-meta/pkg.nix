{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "b1772541e7225c8738b6ac173d51edf6c20ae1b7";
    fetchSubmodules = true;
    sha256 = "sha256-6HRiAJKnut9SWIwtfA5YIgh09szwo7EsWA2Sdb7yIHg=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
