{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "microsocks";
  version = "1.0.4";
  src = fetchFromGitHub ({
    owner = "rofl0r";
    repo = "microsocks";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-cB2XMWjoZ1zLAmAfl/nqjdOyBDKZ+xtlEmqsZxjnFn0=";
  });

  installPhase = ''
    mkdir -p $out/bin/
    install -m 755 microsocks -t $out/bin/
  '';
}
