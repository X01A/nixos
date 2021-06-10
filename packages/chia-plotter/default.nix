{ stdenv, fetchgit, libsodium, gmp, cmake, python3Packages, fetchFromGitHub, substituteAll, python3, boost, pkg-config, ... }:

let
  # fix libsodium no static lib
  # ref: https://github.com/madMAx43v3r/chia-plotter/issues/85
  # ref: https://github.com/NixOS/nixpkgs/pull/5855
  static-libsodium = (libsodium.overrideAttrs (oldAttrs: rec {
    configureFlags = [
      "--disable-pie"
    ];
    dontDisableStatic = true;
    dontStrip = true;
  }));
in
stdenv.mkDerivation rec {
  name = "chia-plotter";

  src = fetchgit {
    url = "https://github.com/madMAx43v3r/chia-plotter.git";
    rev = "f7f63460181297dd34d31ed53421b99633bd03d4";
    sha256 = "Gn3uGOvNsoTmbH4icw+Nkqi/U0JJcfpc3XnF1gi5Xnk=";
    fetchSubmodules = true;
  };

  buildInputs = [ python3 gmp.static boost python3Packages.pybind11 static-libsodium ];
  nativeBuildInputs = [ cmake pkg-config ];

  patches = [
    (substituteAll {
      src = ./dont_fetch_dependencies.patch;
      pybind11_src = python3Packages.pybind11.src;
      relic_src = fetchFromGitHub {
        owner = "relic-toolkit";
        repo = "relic";
        rev = "1885ae3b681c423c72b65ce1fe70910142cf941c"; # pinned by blspy
        hash = "sha256-tsSZTcssl8t7Nqdex4BesgQ+ACPgTdtHnJFvS9josN0=";
      };
    })
  ];

  cmakeFlags = [
    "-DBUILD_BLS_PYTHON_BINDINGS=false"
    "-DBUILD_BLS_TESTS=false"
    "-DBUILD_BLS_BENCHMARKS=false"
  ];

  CMAKE_CXX_FLAGS = "-g -O3 -fmax-errors=1";

  postInstall = ''
    mkdir -p $out/bin
    install -m 755 chia_plot $out/bin
  '';
}
