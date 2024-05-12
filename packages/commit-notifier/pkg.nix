{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ab3818c9a62c6024aac36506e41f9e8004e18ae2";
    fetchSubmodules = true;
    sha256 = "sha256-pqBGdIiVfkMyNInxPM8mh/oMZUavpPC5SX/gYbdwuw4=";
  });

  cargoSha256 = "sha256-QDrLW9NM3fWZg9Vkr4ftqvwT+DO2dZvmzLwvH5MR/Nw=";

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
