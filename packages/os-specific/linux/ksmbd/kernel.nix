{
  lib,
  stdenv,
  fetchFromGitHub,
  linuxPackages,
}:

with linuxPackages;
assert lib.versionAtLeast kernel.version "5.4";

stdenv.mkDerivation {
  pname = "ksmbd";
  version = "3.2.1-unstable-2026-02-22";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd";
    rev = "bbe4cb2fccfa5647fd17bc4b993f57fdd4a01c94";
    fetchSubmodules = true;
    sha256 = "sha256-M4S6MQfaB/vtSx26CpmygmbpMJLnLNECaGSa/IJWY5c=";
  });

  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KVERSION=${kernel.modDirVersion}"
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "MDIR=${placeholder "out"}/lib/modules/${kernel.modDirVersion}"
    # Kernel 6.18.57 annotates kernel_bind()'s address argument as
    # "struct sockaddr_unsized *" (upstream ksmbd only guards this on >= 6.19),
    # so this snapshot's "(struct sockaddr *)" casts trip
    # -Wincompatible-pointer-types. The two types are interchangeable here and
    # the generated code is unchanged, so keep it a warning.
    "KCFLAGS=-Wno-error=incompatible-pointer-types"
  ];

  preConfigure = ''
    sed -i 's|depmod|#depmod|' Makefile
  '';

  meta.platforms = [ "x86_64-linux" ];
}
