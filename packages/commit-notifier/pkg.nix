{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3c4a615b34ed221169bf486404e48fd4656c1364";
    fetchSubmodules = true;
    sha256 = "sha256-6sXUyKGqtmfjy/X7lKuxLcyOgVsQsUYSOGAfOuI+knk=";
  });

  cargoSha256 = "sha256-CFbVPzHrWdbIVxOW9vqKrUC0p9pBcbn09CWn9wDCJ6Q=";

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
