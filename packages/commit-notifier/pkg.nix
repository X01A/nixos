{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a14bc388ff97e2b27a17f08b8ad73cac72689fbe";
    fetchSubmodules = true;
    sha256 = "sha256-mb2Sf4tXcAtEvB821EGlt2NkUa7J3gwohgDUTcYUcK8=";
  });

  cargoSha256 = "sha256-FVNOeb0fBjZAXhCX78DLGcQVdPdfal73sr5z2hTZRZQ=";

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
