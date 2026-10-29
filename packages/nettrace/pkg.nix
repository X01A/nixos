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
    rev = "fcfa07232026025388fa58d8b77d68f867fcd152";
    sha256 = "sha256-LMG+R2+1rU1hDktOjcVY8jplVPo1v/ZoX7sTFkDxluw=";
  };

  # The 2026-03-05 snapshot moved the compiler flags out of src/Makefile
  # (which used ":=") into common.mk, so retarget the libbpf fixups there:
  # nixpkgs ships libbpf as a package, so resolve its headers and libraries
  # through pkg-config instead of the distro-default -lbpf/-lelf/-lz.
  postPatch = ''
    substituteInPlace common.mk \
      --replace-fail '= $(CFLAGS) -Wno-unused-function' \
                     '= $(shell pkg-config --cflags libbpf) $(CFLAGS) -Wno-unused-function' \
      --replace-fail '-lbpf -lelf -lz $(LIBELF_ZSTD_FLAGS)' \
                     '$(shell pkg-config --cflags libbpf) $(shell pkg-config --libs libbpf)'
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
