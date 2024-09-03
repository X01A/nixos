{
  stdenv,
  lib,
  fetchzip,
  kmod,
  linuxPackages_latest,
  kernel ? linuxPackages_latest.kernel,
}:

stdenv.mkDerivation rec {
  name = "yt6801-kernel";

  version = "1.0.29";
  src = fetchzip {
    stripRoot = false;
    url = "https://www.motor-comm.com/Public/Uploads/uploadfile/files/20240812/yt6801-linux-driver-${version}.zip";
    sha256 = "sha256-oz6CeOUN6QWKXxe3WUZljhGDTFArsknjzBuQ4IchGeU=";
  };

  buildInputs = [ kmod ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  postPatch = ''
    substituteInPlace src/Makefile \
      --replace-fail "sudo ls -l" "ls -l" \
      --replace-fail 'depmod $(shell uname -r)' "" \
      --replace-fail 'modprobe $(KFILE)' ""
  '';

  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}"
    "KSRC_BASE="
    "KSRC=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "KDST=kernel/drivers/net/ethernet/motorcomm"
    "INSTALL_MOD_PATH=$(out)"
    "ko_dir=$(out)/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/ethernet/motorcomm/"
    "ko_full=$(out)/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/ethernet/motorcomm/yt6801.ko.xz"
  ];

  meta = with lib; {
    homepage = "https://www.motor-comm.com/product/ethernet-control-chip";
    description = "YT6801 千兆 PCIE 以太网控制器芯片";
    license = licenses.gpl2;  # Derivative of GPL
    maintainers = with maintainers; [ indexyz ];
    platforms = platforms.linux;
  };
}
