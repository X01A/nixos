{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-01-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f72a4f1aa66459d086447ec1a1d434adde240cd0";
    fetchSubmodules = true;
    sha256 = "sha256-JlJaZyE7VN/sC0OWkSaClmd5qbSCccRtV9gxtJVVCFg=";
  });

  cargoHash = "sha256-bGAL0nnqEDt7ZqLR5Rq7t2WH4XHDe1n4bfyQ5VA0wvw=";

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
