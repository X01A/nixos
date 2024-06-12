{ lib, stdenv, fetchFromGitHub, cmake, pkg-config, spdlog, libconfig, poco, uriparser, openssl }:

stdenv.mkDerivation rec {
  pname = "candy";
  version = "5.8.10";

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ spdlog libconfig poco uriparser openssl ];

  src = fetchFromGitHub {
    owner = "lanthora";
    repo = "candy";
    rev = "v${version}";
    sha256 = "sha256-TkJjsEj3x6ofS3pYoPGeCTlnagJ+ZDqETRH+H+mLJRA=";
  };


  meta = with lib; {
    homepage = "https://github.com/lanthora/candy";
    description = "A reliable, low-latency, and anti-censorship virtual private network";
    license = licenses.mit;  # Derivative of GPL
    maintainers = with maintainers; [ indexyz ];
    platforms = platforms.all;
  };
}
