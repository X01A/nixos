{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-12-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "27338995c567ffea047eb0941a74d1b3193ac3f7";
    fetchSubmodules = true;
    sha256 = "sha256-BzFYaTmQcC7de3WwsKTxZQpddEibRXx7avB59W/uBM8=";
  });

  cargoHash = "sha256-tA6W97QJ2ykYKTH5aNeUPhmXm7ADUETi5VOHanrvTCo=";

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
