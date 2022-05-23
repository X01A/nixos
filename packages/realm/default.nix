{ source, rust-bin, makeRustPlatform, lib, pkg-config, openssl, ... }:

let
  rust = rust-bin.nightly.latest.minimal;
  rustPlatform = makeRustPlatform {
    rustc = rust;
    cargo = rust;
  };
in
rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoLock = source.cargoLock."Cargo.lock";

  buildFeatures = [ "multi-thread" "brutal-shutdown" "jemalloc" ];

  buildInputs = [
    openssl
  ];

  nativeBuildInputs = [ pkg-config ];
}
