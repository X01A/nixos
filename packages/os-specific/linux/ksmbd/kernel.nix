{ lib, stdenv, fetchFromGitHub, linuxPackages }:

with linuxPackages;
assert lib.versionAtLeast kernel.version "5.4";

stdenv.mkDerivation {
  pname = "ksmbd";
  version = "unstable-2023-04-18";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd";
    rev = "de6a71cc9b81da7f3793f98496ca88e682f02f06";
    fetchSubmodules = true;
    sha256 = "sha256-e+Qo5Fa+lqvK8s6aOzdMtOKCmGttap806+JRVhbxY1U=";
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
