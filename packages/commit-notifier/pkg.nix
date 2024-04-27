{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e5fe67d2dc559082fb63ea40b18c5f564c09c218";
    fetchSubmodules = true;
    sha256 = "sha256-laE/3mXmI2a8T3tQ6Kq6l83c1GhvnDSGl+t+gLZlDUQ=";
  });

  cargoSha256 = "sha256-t6wM0ut92whb6reTwBpD+9QLVXjYAGuRA6aSZwy8pbw=";

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
