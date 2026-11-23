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
  version = "6.1.13";

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
    sha256 = "sha256-8jv2T9xhHqDADXyuzULWTtfo3c5ge6ZVZff0UGTz/AQ=";
  };

  meta = with lib; {
    homepage = "https://github.com/lanthora/candy";
    description = "A reliable, low-latency, and anti-censorship virtual private network";
    license = licenses.mit; # Derivative of GPL
    maintainers = with maintainers; [ indexyz ];
    platforms = platforms.all;
  };
}
