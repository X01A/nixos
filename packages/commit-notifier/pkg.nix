{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6a735ffdbd1ab052602d210a92d764a08036aa47";
    fetchSubmodules = true;
    sha256 = "sha256-yXSDzlLkvHFg0x2KHlTQOv4R9ScMzQPB8HSfdc99ADE=";
  });

  cargoHash = "sha256-3uDaLCbYhCaFZhAgcZXvr6vH0oUN0iG6paGLx3a6KIY=";

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
