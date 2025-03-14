{ lib, stdenv, fetchFromGitHub, linuxPackages }:

with linuxPackages;
assert lib.versionAtLeast kernel.version "5.4";

stdenv.mkDerivation {
  pname = "ksmbd";
  version = "3.2.1-unstable-2025-03-13";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd";
    rev = "86bdf64576b6381d3d9ff1a63bd61cb85d2dc9d1";
    fetchSubmodules = true;
    sha256 = "sha256-fKq5yFC+ZyLT8GypteH2OheM2xiA8nGyOmj5uf1QrQI=";
  });

  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KVERSION=${kernel.modDirVersion}"
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "MDIR=${placeholder "out"}/lib/modules/${kernel.modDirVersion}"
  ];

  preConfigure = ''
    sed -i 's|depmod|#depmod|' Makefile
  '';

  meta.platforms = [ "x86_64-linux" ];
}
