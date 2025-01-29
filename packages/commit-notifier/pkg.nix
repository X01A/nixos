{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9f4d0928a414e4cc05baaf22c00470f6f1d5f0d7";
    fetchSubmodules = true;
    sha256 = "sha256-SeYFAw9UuvOUGkQtIAz+WuGuP43NzWi7uHBdKoWqtZE=";
  });

  cargoHash = "sha256-YDkmaxM+ogdpNiMW3QLm05FsZptQKcpc1ROwRc+aokc=";

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
