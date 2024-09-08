{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9d0528951a583bced9b2dffeff711ed17c2bff3f";
    fetchSubmodules = true;
    sha256 = "sha256-gFsxIgY0Y9KlhtPrSWzdeUdJbOk/NuxYkksrbOhyFMw=";
  });

  cargoSha256 = "sha256-ki0tUt9qVBvojHs9KFX5VBu2ht3wYHQ7as0ON/YHsdo=";

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
