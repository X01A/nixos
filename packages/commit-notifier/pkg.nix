{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-03-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2f68ca4a118e435d54746f15992e9e48e63eb786";
    fetchSubmodules = true;
    sha256 = "sha256-wgEVTD65kCWXJlmZsIpfdThnw7zzwTAdWSMasDcgS/0=";
  });

  cargoHash = "sha256-NhoH32dvNZWpPRjomK5L2ES+dQ0XsOmCQRL/qMLvkq8=";

  RUSTC_BOOTSTRAP = 1;

  buildInputs = [
    openssl
    sqlite
    libgit2
    zlib
  ];

  # TODO libssh2-sys failed to pass test
  doCheck = false;
  nativeBuildInputs = [ pkg-config ];
}
