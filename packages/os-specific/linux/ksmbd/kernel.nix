{ lib, stdenv, fetchFromGitHub, linuxPackages }:

with linuxPackages;
assert lib.versionAtLeast kernel.version "5.4";

stdenv.mkDerivation {
  pname = "ksmbd";
  version = "3.2.1-unstable-2025-02-12";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd";
    rev = "d636ecf2f11867bbdff3c53877f9ec1b11201e11";
    fetchSubmodules = true;
    sha256 = "sha256-YAx5yNB7Je8bjv1n5Loqc82gfafcSN0XZXpplEO/n0E=";
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
