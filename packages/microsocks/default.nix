{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "microsocks";
  version = "1.0.3";
  src = fetchFromGitHub ({
    owner = "rofl0r";
    repo = "microsocks";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-l+8+zqeY/Qf5pKvzW9WQBfltEvrD7Vp+hJAXM2o16aI=";
  });

  installPhase = ''
    mkdir -p $out/bin/
    install -m 755 microsocks -t $out/bin/
  '';
}
