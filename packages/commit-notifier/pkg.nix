{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "19edeaaed68c990e75b9aecd25a7d02a08f46fcc";
    fetchSubmodules = true;
    sha256 = "sha256-STTA6kXKiDplo0rjJal4pryoyn399QgF8iyzESDnaNc=";
  });

  cargoSha256 = "sha256-4R38fn/caGslaIaWAXCZ76nIAUvQ1fcKOAPfNt0NXVM=";

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
