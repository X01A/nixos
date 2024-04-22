{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fc533ca57f5b095fa7277bc5bc487e0f8c9b3ccc";
    fetchSubmodules = true;
    sha256 = "sha256-nwBzYwkzEOii147E1HFr9XWPcG0aipCWCb/PBmiwgVc=";
  });

  cargoSha256 = "sha256-zkMvG9FzknckKxR3phNbT3BMP+xbPfUUt9z+nv0NU4k=";

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
