{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-28";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "f8b4da525eb8d636e62c7e3508bc31e338345c3f";
    fetchSubmodules = true;
    sha256 = "sha256-xu612+pzPKSFSHvQxwlTBM45/oF2Wa+MQ9vflZ1dVss=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
