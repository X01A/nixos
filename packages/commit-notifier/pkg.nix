{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "74a30c8bdfaeb7b206e47fcc367e394d7afd2c29";
    fetchSubmodules = true;
    sha256 = "sha256-xKb3S43W0HtP2muyfHuIGI2fR/Sssv9W3BfOgT6KMZg=";
  });

  cargoSha256 = "sha256-WTK1opUr9EkbfDQE9nZzX834hCL5ztai2n91qUQrr58=";

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
