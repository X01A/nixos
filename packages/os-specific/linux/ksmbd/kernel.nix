{ lib, stdenv, fetchFromGitHub, linuxPackages }:

with linuxPackages;
assert lib.versionAtLeast kernel.version "5.4";

stdenv.mkDerivation {
  pname = "ksmbd";
  version = "unstable-2023-05-24";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd";
    rev = "05c3e15604d92be4d7dfece9537d673fa5662f4c";
    fetchSubmodules = true;
    sha256 = "sha256-whFnHMb3/KQuu0enQOeNI5W9Y3ALblW77llyPeyLUVY=";
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
