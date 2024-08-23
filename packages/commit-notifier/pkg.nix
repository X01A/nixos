{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "05b9e0e5f696c0af00843e7967b274141c0ffee1";
    fetchSubmodules = true;
    sha256 = "sha256-fj99FJ0EO5HP8rCOF8CkKnxcJLAQElOAf/xjXQ8/qeA=";
  });

  cargoSha256 = "sha256-pucFPJ7YA7PyX65WMW5AkawcUvGNadSD2FMVtG9waAM=";

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
