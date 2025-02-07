{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "microsocks";
  version = "1.0.5";
  src = fetchFromGitHub ({
    owner = "rofl0r";
    repo = "microsocks";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-5NR2gtm+uMkjmkV/dv3DzSedfNvYpHZgFHVSrybl0Tk=";
  });

  installPhase = ''
    mkdir -p $out/bin/
    install -m 755 microsocks -t $out/bin/
  '';
}
