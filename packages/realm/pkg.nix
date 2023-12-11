{ fetchFromGitHub, rust-bin, makeRustPlatform, lib, pkg-config, openssl, ... }:

let
  rust = rust-bin.nightly."2023-06-27".default;
  rustPlatform = makeRustPlatform {
    rustc = rust;
    cargo = rust;
  };
in
rustPlatform.buildRustPackage rec {
  pname = "realm";
  version = "2.5.0";
  src = fetchFromGitHub ({
    owner = "zhboner";
    repo = "realm";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-x3w4SMqglr64zVPN8r+IIR7jjPVKUHE6R9Obd3rPUTA=";
  });

  cargoSha256 = "sha256-YTh4YjAywzTrxfGjRL+Wqd5e3r5fF33xl5jFtgpxHo4=";

  # transport feature broken
  buildNoDefaultFeatures = true;
  buildFeatures = [ "multi-thread" "brutal-shutdown" "jemalloc" "proxy" "balance" ];

  buildInputs = [
    openssl
  ];

  nativeBuildInputs = [ pkg-config ];
}
