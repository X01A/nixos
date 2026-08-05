{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  spdlog,
  libconfig,
  poco,
  uriparser,
  openssl,
}:

stdenv.mkDerivation rec {
  pname = "candy";
  version = "6.1.10";

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  buildInputs = [
    spdlog
    libconfig
    poco
    uriparser
    openssl
  ];

  src = fetchFromGitHub {
    owner = "lanthora";
    repo = "candy";
    rev = "v${version}";
    sha256 = "sha256-xSwEbED7NNH3WoUNMg4FluvMZ6H9pH4koDccse0q+yI=";
  };

  meta = with lib; {
    homepage = "https://github.com/lanthora/candy";
    description = "A reliable, low-latency, and anti-censorship virtual private network";
    license = licenses.mit; # Derivative of GPL
    maintainers = with maintainers; [ indexyz ];
    platforms = platforms.all;
  };
}
