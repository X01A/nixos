{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "4e924c5183262f70b2e49f8c7af42b7742c5d44d";
    fetchSubmodules = true;
    sha256 = "sha256-fYmrUle4zO9kYL+y6yunOla5OrA9q/r73KvEGJljHOU=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
