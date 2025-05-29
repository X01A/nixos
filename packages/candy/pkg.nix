{ lib, stdenv, fetchFromGitHub, cmake, pkg-config, spdlog, libconfig, poco, uriparser, openssl }:

stdenv.mkDerivation rec {
  pname = "candy";
  version = "6.0.1";

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ spdlog libconfig poco uriparser openssl ];

  src = fetchFromGitHub {
    owner = "lanthora";
    repo = "candy";
    rev = "v${version}";
    sha256 = "sha256-BYoLQGLpLr96Te1b5hHCxI5csvwxh053z3dfRH+3hqs=";
  };


  meta = with lib; {
    homepage = "https://github.com/lanthora/candy";
    description = "A reliable, low-latency, and anti-censorship virtual private network";
    license = licenses.mit;  # Derivative of GPL
    maintainers = with maintainers; [ indexyz ];
    platforms = platforms.all;
  };
}
