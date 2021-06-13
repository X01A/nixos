{ stdenv, fetchgit, libsodium, cmake, python3Packages, fetchFromGitHub, substituteAll, pkg-config, ... }:

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
    rev = "16f9793b78b60eb9a4e84ff8048998c3ac62a0e5";
    sha256 = "06mb3hfx9p3ccdzhmv9hs7j6nwdzg1p5rj7pspp6awsfr6n2axdx";
    fetchSubmodules = true;
  };

  buildInputs = [ static-libsodium ];
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
