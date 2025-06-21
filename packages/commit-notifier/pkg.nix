{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-06-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e248628f0a084a6ee7c9fed6348ec7f079638c2e";
    fetchSubmodules = true;
    sha256 = "sha256-iC8QkxMW591HmuZt9eNBrUZ8iGvW0TI5D1viM9ViRHY=";
  });

  cargoHash = "sha256-3HQpBLvIBKS/8ep2pCz9dX/0fNLnpo4oMDXmlQCzR/I=";

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
