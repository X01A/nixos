{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8e3edc781f702f8d1f0695c61c9c764a696fece0";
    fetchSubmodules = true;
    sha256 = "sha256-dOxZD5RwfRsH4I2mk0sbmgzvfLdjI6wET8CPfRBrx4s=";
  });

  cargoSha256 = "sha256-9CQikjWBfdkSGAJt2WbWb3NgPQ4LxE2wg3YcDBt2nOw=";

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
