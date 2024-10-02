{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dbcb2104f7b98c48a69a8f8e86a973c10cf073bd";
    fetchSubmodules = true;
    sha256 = "sha256-AzkIR9fh15d6WjwJTQ25cirX870RxoqkmV0QUcq0V+E=";
  });

  cargoSha256 = "sha256-27vEwc1ni/9FMvLX1r+HaZRqR+OsKIP2wY1yNWKYhjY=";

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
