{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "22246c8afbbb357a5df9d3cdebf7e1ea8d551901";
    fetchSubmodules = true;
    sha256 = "sha256-EWsDiFoHvGw6FkxWn5OTKFBQpVpD2JQE3GNZqXlww3A=";
  });

  cargoSha256 = "sha256-cgSBJk0GPgRSNA7iW2jpqqmJO9jHaE+vrQKDRTTWxeg=";

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
