{ stdenv, clang, clang-tools, zlib, glibc, llvm, fetchFromGitHub, pkg-config, python3, libelf, libbpf, bpftools, ... }:

let
  python3WithPackages = python3.withPackages (python-packages: with python-packages; [
    pyyaml
  ]);
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

  hardeningDisable = [
    "stackprotector"
    "zerocallusedregs"
  ];

  nativeBuildInputs = [
    pkg-config
    python3WithPackages
  ];

  buildInputs = [
    libelf
    libbpf
    bpftools
    llvm
    clang-tools
    clang
    zlib.static
    glibc.static
  ];
}
