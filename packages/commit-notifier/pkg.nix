{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e7d1d62f8f7fbd77b58fbc8e91543c1762c558ce";
    fetchSubmodules = true;
    sha256 = "sha256-n5ownrY6B+ZM2szUIE81P7eAq5FcEBbWWlFrI4XZrSM=";
  });

  cargoSha256 = "sha256-/mmZGgeVKMvgC3pBJT3ry39iDujQ/SICdqrvXaKUB4g=";

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
