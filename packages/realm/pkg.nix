{
  fetchFromGitHub,
  rust-bin,
  makeRustPlatform,
  lib,
  pkg-config,
  openssl,
  ...
}:

let
  rust = rust-bin.selectLatestNightlyWith (toolchain: toolchain.default);
  rustPlatform = makeRustPlatform {
    rustc = rust;
    cargo = rust;
  };
in
rustPlatform.buildRustPackage rec {
  pname = "realm";
  version = "2.9.4";
  src = fetchFromGitHub ({
    owner = "zhboner";
    repo = "realm";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-gnsFqWhJOMKUaSWfRmHBksw3uWFP0smRhEbPLriEmlk=";
  });

  cargoHash = "sha256-b/cG6fGoAdhvmZXSQv/QkY3QKiMT7YcfEGohZSbk0q8=";

  # transport feature broken
  buildNoDefaultFeatures = true;
  buildFeatures = [
    "multi-thread"
    "brutal-shutdown"
    "jemalloc"
    "proxy"
    "balance"
  ];

  buildInputs = [
    openssl
  ];

  nativeBuildInputs = [ pkg-config ];
}
