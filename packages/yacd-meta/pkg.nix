{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-20";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "4101d2121d886bd6668a74c9e58c1ad9cc87eb55";
    fetchSubmodules = true;
    sha256 = "sha256-JiaLIEqz770v2YBLJ8bG5kvBqQAzkPMpOHu2AErrDEk=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
