{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d6ecf3dfc4edd253756a9c073b6ccd498fba9492";
    fetchSubmodules = true;
    sha256 = "sha256-M08tE3WG+MsYiX/kDnK8aiVijFue3IqHOdkg5rU7H74=";
  });

  cargoHash = "sha256-q7VaTdRTRxQBcH30g3TXu+YvbLMJjpf6uAj/gFKeWO4=";

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
