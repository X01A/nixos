{ lib, stdenv, fetchFromGitHub, linuxPackages }:

with linuxPackages;
assert lib.versionAtLeast kernel.version "5.4";

stdenv.mkDerivation {
  pname = "ksmbd";
  version = "unstable-2023-12-15";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd";
    rev = "8869ec04f7d6a04eedac3b378e9ee1dfa7ea7bc9";
    fetchSubmodules = true;
    sha256 = "sha256-fgtHTQdI+I+3SJCTNb5KrvH1kULVzLScYispFIzr3GY=";
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
