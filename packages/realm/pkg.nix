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
  version = "2.9.2-2";
  src = fetchFromGitHub ({
    owner = "zhboner";
    repo = "realm";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-TWtLwGjL0nOK6NYxG+Q22hS9PGq9igokNPjUxRLiPl8=";
  });

  cargoHash = "sha256-RRqOfKbZ6tATYW55EJd1r2zQA0Vt463eGn1fuNO8k5M=";

  # transport feature broken
  buildNoDefaultFeatures = true;
  buildFeatures = [ "multi-thread" "brutal-shutdown" "jemalloc" "proxy" "balance" ];

  buildInputs = [
    openssl
  ];

  nativeBuildInputs = [ pkg-config ];
}
