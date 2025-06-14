{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-06-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4b0859e9381745eae3d2c16159aaf4fad6be6486";
    fetchSubmodules = true;
    sha256 = "sha256-ci6hOdQjQ9QxunlRr2uNWvJVHDupaf+WSEKfKLXG++c=";
  });

  cargoHash = "sha256-CLWU33/ScthLpytjRrCJ/uRo2gncbF2b8qr91zAuuXw=";

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
