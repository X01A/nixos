{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "372659980bec5516bd29a669760dda9701240838";
    fetchSubmodules = true;
    sha256 = "sha256-bbBbR5hpauPKHCeQ94xGwSEKJhBk2pau7QOiTlSRVE8=";
  });

  cargoSha256 = "sha256-7jyHiDGVrNlYmA2QjZSM0LQLBUU9eTm5jQVk5mRvhOg=";

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
