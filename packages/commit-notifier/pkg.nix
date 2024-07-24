{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "524930abc8150734da0176e3c28ee56b718cc374";
    fetchSubmodules = true;
    sha256 = "sha256-y2lndFz4BM9IywUgNBhVvLUyhJo43v5AsKNBh75mBVU=";
  });

  cargoSha256 = "sha256-ls6A+gsrzFwRcshXWNWisPWmifp86G2Jt+lOGvX7+dk=";

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
