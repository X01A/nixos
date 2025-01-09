{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fc4fcc72c1ccbeee8742a7482112ed822f69ec0f";
    fetchSubmodules = true;
    sha256 = "sha256-DPaC0r5h60S3ku1WSRgok0Ti4VW5gXYVtSazWt/3JNo=";
  });

  cargoHash = "sha256-O1oj2ZQINmqF+Jtcy9Es7oxpIwYhtAE/Rw0eMHDGNz0=";

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
