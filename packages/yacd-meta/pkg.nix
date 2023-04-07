{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-07";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "19cccbf2a79d38b990dd7fc2fa70cdd712991572";
    fetchSubmodules = true;
    sha256 = "sha256-ZDyWjwg1TZHYgJjiYpnB5Mbex+/rDkj7g8I/16cIxys=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
