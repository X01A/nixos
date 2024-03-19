{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f0f884c7c5865f48d32ef95311997467abd49371";
    fetchSubmodules = true;
    sha256 = "sha256-QduOWLyY8W3PMf2foRnkO28YuoyuigO6WU2aVlmsCI4=";
  });

  cargoSha256 = "sha256-w4GvrLWC6gYT3HCvVdOEzrHXXEKkn6N510hC7M96p6U=";

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
