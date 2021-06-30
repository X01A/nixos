{ lib, stdenv, fetchFromGitHub, linuxPackages }:

with linuxPackages;
assert lib.versionAtLeast kernel.version "5.4";

stdenv.mkDerivation {
  pname = "ksmbd";
  version = "20210416";

  src = fetchFromGitHub {
    owner = "namjaejeon";
    repo = "ksmbd";
    rev = "dbf652447bcdffe89708bea243e3d1709b7589a1";
    sha256 = "0djnhkcqm5hyvwds2z7w3d8y133hrcqbcy0hd9ajw91csy3shbff";
  };

  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KVERSION=${kernel.modDirVersion}"
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "MDIR=${placeholder "out"}/lib/modules/${kernel.modDirVersion}"
  ];

  preConfigure = ''
    sed -i 's|depmod|#depmod|' Makefile
  '';
}
