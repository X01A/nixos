{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "417f67b112862214924f2dbde4988e819d1e4502";
    fetchSubmodules = true;
    sha256 = "sha256-EJhPuHFWM70tjrJ4raGRtP87lD9xpohaDNgrtHSNIYM=";
  });

  cargoHash = "sha256-LeIsBvD9J9yTDpJcr1rUmYB6M+x7ZI8ygKGAp+rMqu4=";

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
