{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-01";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "202229aeed7637481c108eb9f19a146fdce0beb2";
    fetchSubmodules = true;
    sha256 = "sha256-jdAxM8l1j+pCeb5fNYIINRGsAaUJNlNSREdsdgD0Dg0=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
