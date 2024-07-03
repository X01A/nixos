{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ebd5af6848e1ffc16ec58650795387f9060348bb";
    fetchSubmodules = true;
    sha256 = "sha256-9ennqst7ATjPoA45YLQpfHIXa7GvtE59taXXDzEEVfw=";
  });

  cargoSha256 = "sha256-6s3+Xs/iS5FzAA3P9CZXQDb8yVm6boZQDqJDpWgFQ9Q=";

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
