{ fetchFromGitHub, rust-bin, makeRustPlatform, lib, pkg-config, openssl, ... }:

let
  rust = rust-bin.selectLatestNightlyWith (toolchain: toolchain.default);
  rustPlatform = makeRustPlatform {
    rustc = rust;
    cargo = rust;
  };
in
rustPlatform.buildRustPackage rec {
  pname = "realm";
  version = "2.4.6";
  src = fetchFromGitHub ({
    owner = "zhboner";
    repo = "realm";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-7Dyj3NQ2vq0m1Qm8wMzB9BmEZqUPabLSbi9J5kFGSoc=";
  });

  cargoSha256 = "sha256-0fLpv2Ct3Zz2Uh3JY09jrUIcc3Qf0N+arTIUUAHIVoY=";

  # transport feature broken
  buildNoDefaultFeatures = true;
  buildFeatures = [ "multi-thread" "brutal-shutdown" "jemalloc" "proxy" "balance" ];

  buildInputs = [
    openssl
  ];

  nativeBuildInputs = [ pkg-config ];
}
