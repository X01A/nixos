{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4a1ee5fb8c6485568c2a65f6227a5dee788d6ce6";
    fetchSubmodules = true;
    sha256 = "sha256-GeZPzIi7sIgST+hQg2T0ohMsiUEtpvMF/QV5uvEZuA8=";
  });

  cargoSha256 = "sha256-BnT5irutdyM4ohfrMKSnH9cMG7jxDj4zBAksQzaA46k=";

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
