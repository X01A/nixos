{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cbf2350400b0bab3db8f0bc1bfbe6cbb2e1fb809";
    fetchSubmodules = true;
    sha256 = "sha256-BLXNq77vTWN2E89vNVXNLg4+o0OnMfQlBsZZtF+YK1c=";
  });

  cargoSha256 = "sha256-tkoInRCDCLm7DCGpkeh4Bt6InH18Lvrx0wM42nRWdAE=";

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
