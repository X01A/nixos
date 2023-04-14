{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-14";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "ba665c69b7df9762794ab926edfbc58cc5feaff4";
    fetchSubmodules = true;
    sha256 = "sha256-N3srow0KD3tue1iqDEnxAMQsL6yhFFDwch0oMUvLagI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
