{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "13c610e14d2abac27d6fb1b32e1681b570118c38";
    fetchSubmodules = true;
    sha256 = "sha256-bk756InOD/SSEQOQw2lxSEuPXGrvl9sNSQF9pBT09+A=";
  });

  cargoHash = "sha256-CXw9HAeDjtP1sq943jLrx1+czMLGFjKwU/W9/WKnJEo=";

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
