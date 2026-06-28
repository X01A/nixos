{
  stdenv,
  linuxPackages_latest,
  kernel ? linuxPackages_latest.kernel,
  clang,
  clang-tools,
  zlib,
  zstd,
  llvm,
  fetchFromGitHub,
  pkg-config,
  python3,
  libbpf,
  libbfd,
  bpftools,
  lib,
  elfutils,
  ...
}:

let
  python3WithPackages = python3.withPackages (
    python-packages: with python-packages; [
      pyyaml
    ]
  );
in
stdenv.mkDerivation rec {
  pname = "nettrace";
  version = "1.2.11-unstable-2026-03-05";

  src = fetchFromGitHub {
    owner = "OpenCloudOS";
    repo = pname;
    rev = "d455f001315322db4d606a8bdf8c659ba36b269c";
    sha256 = "sha256-Yr1wN1VVcMDyKdVDGoIWLGuGaRaOPVPBkUHhRzj9zZM=";
  };

  postPatch = ''
    substituteInPlace src/Makefile \
      --replace-fail 'BPF_CFLAGS	:= -O2 -g -Wall -D__TARGET_ARCH_$(SRCARCH) -target bpf	\' \
                     'BPF_CFLAGS	:= $(shell pkg-config --cflags libbpf) -O2 -g -Wall -D__TARGET_ARCH_$(SRCARCH) -target bpf	\' \
      --replace-fail 'HOST_CFLAGS	:= -lbpf -lelf -lz $(LIBELF_ZSTD_FLAGS) -pthread -O2 -Wall \' \
                     'HOST_CFLAGS	:= $(shell pkg-config --cflags libbpf) $(shell pkg-config --libs libbpf) -pthread -O2 -Wall \'
  '';

  makeFlags = [
    "KERNEL=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
  ];

  installPhase = ''
    runHook preInstall

    install -Dm755 src/nettrace $out/bin/nettrace

    runHook postInstall
  '';

  hardeningDisable = [
    "zerocallusedregs"
  ];

  nativeBuildInputs = [
    pkg-config
    python3WithPackages
  ];

  buildInputs = [
    libbpf
    libbfd
    bpftools
    llvm
    clang-tools
    clang.cc
    zlib
    zstd
    elfutils
  ];

  meta = with lib; {
    mainProgram = "nettrace";
    platforms = platforms.linux;
  };
}
