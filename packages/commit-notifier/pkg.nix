{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f58faf2047833bb0cf6c8b0f5ae8603c5951c0da";
    fetchSubmodules = true;
    sha256 = "sha256-jMNanAAqcymvCcG9MTvSZpMBuC0lM6C6+MIZYMOlCxA=";
  });

  cargoSha256 = "sha256-tT10Qku9nfs0CbBDUsEJuD1z2cOfI0LrYZZbVFU2d8E=";

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
