{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e45797f5f7f3c09031a757aefb8e79e5766fa600";
    fetchSubmodules = true;
    sha256 = "sha256-IwpUaAVAr0h48r9zSasBMUGIXcikD08sjem8kaEEPDE=";
  });

  cargoHash = "sha256-68aq2p9bfCe6EYliQu/srxVQLE9DjK3DGTHen6lgpUs=";

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
