{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-03";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "ee7dff87f0e09cc2d36866aefea2ffaf9aedf0a8";
    fetchSubmodules = true;
    sha256 = "sha256-elz10fUPEZje9RrjwT+t1z9X5dnaKkgbsjDhCdCrYCc=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
