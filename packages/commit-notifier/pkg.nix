{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1f2d9e7d7d43384d8fce651ea70461c018455b13";
    fetchSubmodules = true;
    sha256 = "sha256-Z9GepMzEwawrntKZvr/5xhb0YUZ8nlxFiVZJDQW90Tw=";
  });

  cargoHash = "sha256-0s3DHHLVMZaMREsagE529G0aCvekbunLH4tDhep/cpA=";

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
