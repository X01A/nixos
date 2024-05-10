{ fetchFromGitHub, stdenv, libpcap }:

stdenv.mkDerivation rec {
  pname = "tzsp2pcap";
  version = "unstable-2018-12-15";

  src = fetchFromGitHub ({
    owner = "thefloweringash";
    repo = pname;
    rev = "4fb8147c15ad5fcf887a8e880d40596c955fbead";
    sha256 = "sha256-Pk4jQ782pjPPZfBf78/Gp6eoKrD4FlpNLdCm7h/z8/8=";
  });

  buildInputs = [ libpcap ];

  installPhase = ''
    mkdir -p $out/bin
    make install DESTDIR=$out
  '';
}
