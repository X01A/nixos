{ lib, stdenv, fetchFromGitHub, cmake, pkg-config, spdlog, libconfig, poco, uriparser, openssl }:

stdenv.mkDerivation rec {
  pname = "candy";
  version = "5.6";

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ spdlog libconfig poco uriparser openssl ];

  src = fetchFromGitHub {
    owner = "lanthora";
    repo = "candy";
    rev = "v${version}";
    sha256 = "sha256-5JRQxs3sDs5fqyaUl8+3qGsWX6J5oaU+YzwucqfRq38=";
  };


  meta = with lib; {
    homepage = "https://github.com/lanthora/candy";
    description = "A reliable, low-latency, and anti-censorship virtual private network";
    license = licenses.mit;  # Derivative of GPL
    maintainers = with maintainers; [ indexyz ];
    platforms = platforms.all;
  };
}