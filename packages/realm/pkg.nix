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
  version = "2.4.5";
  src = fetchFromGitHub ({
    owner = "zhboner";
    repo = "realm";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-Xmx9Z1KC7Z6KeixdPjYVo+RScfggLu71PQswJxlk3WY=";
  });

  cargoSha256 = "sha256-mmgWAdwu0htmTbPPYQiEmnRQ0psDjdivaL6TQpqHvk0=";

  # transport feature broken
  buildNoDefaultFeatures = true;
  buildFeatures = [ "multi-thread" "brutal-shutdown" "jemalloc" "proxy" "balance" ];

  buildInputs = [
    openssl
  ];

  nativeBuildInputs = [ pkg-config ];
}
