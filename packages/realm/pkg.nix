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
  version = "2.9.6";
  src = fetchFromGitHub ({
    owner = "zhboner";
    repo = "realm";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-P7jyVe6KNe1evan2qRtpA99ZKbgF1Zz7DiRxi1+h7WI=";
  });

  cargoHash = "sha256-kuoYEGn419LtJRGoWzlvgclkjW0zh94XX6OvCsa5Hfc=";

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
