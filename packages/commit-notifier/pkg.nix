{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "70a05d51c765455c1b21e88bc4a80685b277f263";
    fetchSubmodules = true;
    sha256 = "sha256-pTX9+sjWR+lTi1ivddZ+/ptPXHtzO2T+jCWZL+nFrvM=";
  });

  cargoSha256 = "sha256-KXnI2KQ7f3HdQz/V+CN7SigFwcfitO3CqTdNGfcNnFc=";

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
