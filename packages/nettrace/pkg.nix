{
  stdenv,
  linuxPackages_latest,
  kernel ? linuxPackages_latest.kernel,
  clang,
  clang-tools,
  zlib,
  glibc,
  llvm,
  fetchFromGitHub,
  pkg-config,
  python3,
  libelf,
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
  version = "1.2.11";

  src = fetchFromGitHub {
    owner = "OpenCloudOS";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-mcshgNOsRpNXcoYfT0I+mbZlLu/sW38vRBSrK4lDXms=";
  };

  postPatch = ''
    substituteInPlace common.mk \
      --replace-fail '-I$(ROOT)/shared/bpf/' '-I$(ROOT)/shared/bpf/ -I${lib.getDev libbpf}/include/'
  '';

  makeFlags = [
    "KERNEL=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
  ];

  hardeningDisable = [
    "zerocallusedregs"
  ];

  nativeBuildInputs = [
    pkg-config
    python3WithPackages
  ];

  buildInputs = [
    libelf
    libbpf
    libbfd
    bpftools
    llvm
    clang-tools
    clang.cc
    zlib.static
    glibc.static
    elfutils
  ];
}
