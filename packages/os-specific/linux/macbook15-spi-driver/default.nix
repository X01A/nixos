{ lib, stdenv, kernel, fetchFromGitHub, }:

stdenv.mkDerivation rec {
  name = "macbook15-spi-driver";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "hlolli";
    repo = "macbook15-spi-driver";
    rev = "86a2f37ca0d2a4729a32b636dc48f39c522dd8ad";
    sha256 = "1724s3y8ad14s8a0rag9jadb69j0j2vn566fzg6basx2bmfrj8gi";
  };

  nativeBuildInputs = kernel.moduleBuildDependencies;
  makeFlags = [ "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" ];
  buildPhase = ''
    make -j$NIX_BUILD_CORES M=$(pwd) modules
  '';

  installPhase = ''
    make INSTALL_MOD_PATH=$out M=$(pwd) modules_install
  '';

  meta = with lib; {
    platforms = platforms.linux;
  };
}
